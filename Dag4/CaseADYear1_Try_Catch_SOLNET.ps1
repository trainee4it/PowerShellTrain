
Function Get-FileName($initialDirectory)
{  
 [System.Reflection.Assembly]::LoadWithPartialName(“System.windows.forms”) |
 Out-Null

 $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
 $OpenFileDialog.initialDirectory = $initialDirectory
 $OpenFileDialog.filter = “All files (*.*)| *.*”
 $OpenFileDialog.ShowDialog() | Out-Null
 $OpenFileDialog.filename
} #end function Get-FileName


$UsersToImport = Import-Csv -Path (Get-FileName)

#Ophalen distinguishedname dus in dit geval dc=adatum,dc=com, bij jullie dc=contoso,dc=com
$RootDomain = (Get-ADDomain).distinguishedname

#ophalen suffix in dit geval adataum.com, bij jullie contoso.com
$UPNSUFFIX = (Get-ADDomain).forest

foreach($Item in $UsersToImport)
{

    #Krijg op het volgende commando foutmeldingen omdat
    #de OU uiteindelijk heel veel keer aangemaakt probeert te worden (77 keer)
    #Geen probleem, dit lossen we later op

    # +++++++++++++> Incorporeer hier de OU null check <++++++++++
    $OU = 'OU='+$item.DESCRIPTION +','+$RootDomain 

    try
    {
    
        Get-ADOrganizationalUnit -Identity $OU -ErrorAction Stop
    
    } 

    catch
    {

        New-ADOrganizationalUnit -Name $Item.Description


    }


    #Dit wordt de inlognaam zowel samaccountname als UPN
    $SamAccountName = $Item.FIRSTNAME[0] + $Item.LASTNAME
    
    
    $UPN = $SamAccountName +'@'+$UPNSUFFIX
    $SecurePassword = ConvertTo-SecureString -String 'Pa55w.rd1234' -AsPlainText -Force
    $DisplayName = $Item.FIRSTNAME + ' '+ $Item.LASTNAME

    New-ADUser -Name $DisplayName -UserPrincipalName $UPN -SamAccountName $SamAccountName -Enabled $true -AccountPassword $SecurePassword -GivenName $Item.FIRSTNAME -Surname $Item.LASTNAME -Path $OU
    
    Write-Verbose -Message ("creating user " + $SamAccountName) -Verbose


}
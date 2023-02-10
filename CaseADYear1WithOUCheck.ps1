$UsersToImport = Import-Csv -Path 'E:\Year1.csv'

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
    $ouexists = $null

    $ouexists = Get-ADOrganizationalUnit -Filter * | Where-Object {$PSItem.name -eq $item.Description} 

    if($ouexists -eq $null)
    {

        New-ADOrganizationalUnit -Name $Item.description

    }

    else
    {


        Write-Verbose -Message ($Item.DESCRIPTION + ' bestaat al !') -Verbose


    }


    #Dit wordt de inlognaam zowel samaccountname als UPN
    $SamAccountName = $Item.FIRSTNAME[0] + $Item.LASTNAME
    
    $OU = 'OU='+$item.DESCRIPTION +','+$RootDomain 
    $UPN = $SamAccountName +'@'+$UPNSUFFIX
    $SecurePassword = ConvertTo-SecureString -String 'Pa55w.rd1234' -AsPlainText -Force
    $DisplayName = $Item.FIRSTNAME + ' '+ $Item.LASTNAME

    New-ADUser -Name $DisplayName -UserPrincipalName $UPN -SamAccountName $SamAccountName -Enabled $true -AccountPassword $SecurePassword -GivenName $Item.FIRSTNAME -Surname $Item.LASTNAME -Path $OU
    
    Write-Verbose -Message ("creating user " + $SamAccountName) -Verbose


}
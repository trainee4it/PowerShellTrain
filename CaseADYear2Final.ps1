$UsersToImport = Import-Csv -Path 'E:\Year2.csv'

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
    
    
    #Hier checek nof user bestaat of niet 
    $UserExists = $null

    $UserExists = Get-ADUser -Filter * | Where-Object {$PSItem.Samaccountname -eq $SamAccountName}

    if($UserExists -eq $null)
    {

        New-ADUser -Name $DisplayName -UserPrincipalName $UPN -SamAccountName $SamAccountName -Enabled $true -AccountPassword $SecurePassword -GivenName $Item.FIRSTNAME -Surname $Item.LASTNAME -Path $OU
    
        Write-Verbose -Message ("creating user " + $SamAccountName) -Verbose
    
    }
    else
    {
        
        Write-Verbose -Message ("User Exists " + $SamAccountName) -Verbose
        #Zit user juiste ok ?
        $UserObject = Get-ADUser -Identity $SamAccountName
        #Hier kijken we op distinguishedname en splitten om het ou gedeelte eruit te halen
        #CN=Hemant Mahawar,OU=Finance,DC=Adatum,DC=com
        if($UserObject.DistinguishedName.Split(',=')[3] -eq $Item.DESCRIPTION)
        {
            
            Write-Verbose -Message ("User " +$SamAccountName + " zit in de juiste OU") -Verbose 

        }
        else
        {
            
            Write-Verbose -Message ("User " +$SamAccountName + " zit niet in de juiste OU") -Verbose
            $UserObject | Move-ADObject -TargetPath $OU

        }


    }
    


}
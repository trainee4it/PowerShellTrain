##IMPORT LOCALUSERS
$UsersToImport = Import-Csv -Path 'C:\Apps\users.csv'


foreach($Item in $UsersToImport)
{

    $SecurePassword = ConvertTo-SecureString -String $Item.WACHTWOORD -AsPlainText -Force


    New-LocalUser -Name $Item.NAAM -Password $SecurePassword -Description $Item.AFDELING


}


##IMPORT AD USERS


$UsersToImport = Import-Csv -Path 'C:\Apps\users.csv'


foreach($Item in $UsersToImport)
{

    $SecurePassword = ConvertTo-SecureString -String $Item.WACHTWOORD -AsPlainText -Force


   New-ADUser -Name $Item.NAAM -AccountPassword $SecurePassword -SamAccountName $Item.NAAM -Enabled $true -Path ('OU='+$item.AFDELING + ',dc=adatum,dc=com')

}
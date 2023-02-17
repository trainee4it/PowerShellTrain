#1
$Names = Import-Csv -Path E:\Names.csv

foreach($item in $Names)
{
    
      $SecurePassword = ConvertTo-SecureString -String $item.PASSWORD -AsPlainText -Force
    
    New-LocalUser -Name $item.NAME -Password $SecurePassword -Description $item.DEPARTMENT



}






#2
$Names = Import-Csv -Path E:\Names.csv

foreach($Item in $Names)
{
    New-ADOrganizationalUnit -Name $Item.Department
    
    $OU = 'OU=' +$item.Department + ',DC=Adatum,DC=com'
    
    $SecurePassword = ConvertTo-SecureString -String $item.PASSWORD -AsPlainText -Force

    New-ADUser -Name $Item.Name -AccountPassword $SecurePassword -Path $OU -Enabled $true


}

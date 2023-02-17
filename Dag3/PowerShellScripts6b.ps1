




#1 Met CHECK OU
$Names = Import-Csv -Path E:\Names.csv

foreach($Item in $Names)
{
    
   $OuIsThere = $null

   $OuIsThere= Get-ADOrganizationalUnit -Filter * | Where-Object {$_.name -eq $Item.DEPARTMENT}
    
   if($OuIsThere -eq $null)
   {
    
        New-ADOrganizationalUnit -Name $Item.Department
   
   } 
    $OU = 'OU=' +$item.Department       + ',DC=Adatum,DC=com'
    
    $SecurePassword = ConvertTo-SecureString -String $item.PASSWORD -AsPlainText -Force

    New-ADUser -Name $Item.Name -AccountPassword $SecurePassword -Path $OU -Enabled $true


}

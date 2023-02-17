$Names = Get-Content -Path c:\data\names.txt
New-ADOrganizationalUnit -Name smurfs
foreach($Item in $Names)
{

    $OU = 'OU=Smurfs,DC=Adatum,DC=com'
    
    $SecurePassword = ConvertTo-SecureString -String 'Pa55w.rd1234' -AsPlainText -Force

    New-ADUser -Name $Item -AccountPassword $SecurePassword -Path $OU -Enabled $true



}
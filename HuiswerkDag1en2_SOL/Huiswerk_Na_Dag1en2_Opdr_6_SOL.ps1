'Geef de naam van de OU op '

$OuName = Read-Host


$Path = 'OU='+$OuName +',DC=adatum,dc=com'

New-ADOrganizationalUnit -Name $OuName


Get-ADUser -Filter * -Properties * | Where-Object {$PSItem.Description -eq 'LOTR'} | Move-ADObject -TargetPath $Path


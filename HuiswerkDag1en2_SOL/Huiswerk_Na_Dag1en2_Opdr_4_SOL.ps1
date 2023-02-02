


'Geef de samAccountName van een aan te maken Active Directory user op '

$UserName = Read-Host

'Welke OU ? '

$OU = Read-Host

$Path = 'OU='+$OU +',DC=adatum,dc=com'

New-ADOrganizationalUnit -Name $OU  #Geen check of UO bestaat, lossen we op

$SecurePassWord = ConvertTo-SecureString -String 'Pa55w.rd' -AsPlainText -Force

New-ADUser -Name $UserName -Enabled $true -AccountPassword $SecurePassWord -Path $Path








'Geef de samAccountName van een aan te maken Active Directory user op '

$UserName = Read-Host

$SecurePassWord = ConvertTo-SecureString -String 'Pa55w.rd' -AsPlainText -Force

New-ADUser -Name $UserName -Enabled $true -AccountPassword $SecurePassWord 





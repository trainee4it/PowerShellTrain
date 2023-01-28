#1

'PowerShell Rocks'


#2

'Geef wat op '

$OpGave = Read-Host

'Je gaf dit op ' + $OpGave


#3

'Please provide a user '

$Name = Read-Host


Get-LocalUser -Name $Name | Disable-LocalUser

Get-LocalUser -Name $Name


 #4

 'Please provide a service '

$Name = Read-Host


Get-Service -Name $Name | Stop-Service


Get-Service -Name $Name

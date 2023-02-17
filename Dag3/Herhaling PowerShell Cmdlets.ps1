#1

$SecurePassWord = ConvertTo-SecureString -String 'HeroesInAHalfShell3' -AsPlainText -Force
New-LocalUser -Name 'NinjaTurtlePower1' -Password $SecurePassWord -Description 'turtle'


#2

Get-LocalUser -Name 'NinjaTurtlePower1' | Set-LocalUser -Description 'justatoad'

#3 Switch to DC1

$SecurePassWord = ConvertTo-SecureString -String 'P@sssw0rd1234' -AsPlainText -Force

$OU = 'ou=turtles,dc=adatum,dc=com'

New-ADuser -Name 'AdTurtle1' -AccountPassWord $SecurePassWord -Enabled $true -Path $OU

New-ADuser -Name 'AdTurtle2' -AccountPassWord $SecurePassWord -Enabled $true -Path $OU


#4

Get-ADUser -Filter * -Properties * | Where-Object {$PSitem.Distinguishedname -like '*ou=turtles*'} | Set-ADUser -Description 'SadTurtles'

#5

New-Item -Path 'c:\DataMap' -ItemType Directory


#6

New-Item -Path 'C:\datamap\1.txt' -ItemType File
New-Item -Path 'C:\datamap\2.txt' -ItemType File
New-Item -Path 'C:\datamap\3.txt' -ItemType File

#7

Get-ChildItem -Path 'C:\datamap'  | Remove-Item


#8

Get-ADUser -Filter * -Properties * | Where-Object {$PSitem.Description -eq 'sadturtles'} 


#9

$SecurePassWord = ConvertTo-SecureString -String 'P@sssw0rd1234' -AsPlainText -Force

Get-ADUser -Filter * -Properties * | Where-Object {$PSitem.Description -eq 'sadturtles'} | Set-Adaccountpassword -NewPassword $SecurePassWord

#10

Get-ADUser -Filter * -Properties * | Where-Object {$PSitem.Description -eq 'sadturtles'} | Out-File -FilePath 'C:\sad.txt'
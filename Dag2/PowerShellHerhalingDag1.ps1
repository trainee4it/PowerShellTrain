#1 ...


#2 

Get-Process -Name 'notepad'| Stop-Process

######OF#####

Get-Process | Where-Object {$PSItem.Name -eq 'notepad'} | Stop-Process


#3

Get-Process | Where-Object {$PSItem.HandleCount -gt 100 } | Out-File -FilePath 'C:\bigger100.txt'

#4

New-Item -Path 'c:\files' -ItemType Directory

#5

New-Item -Path C:\files\1.txt -ItemType File


New-Item -Path C:\files\2.txt -ItemType File


New-Item -Path C:\files\3.txt -ItemType File


New-Item -Path C:\files\4.txt -ItemType File



#6 Teacher's favorite ;)

Get-ChildItem -Path C:\files | Remove-Item 

#Meer specifiek is :

Get-ChildItem -Path 'C:\files' | Where-Object {$PSItem.Extension -eq '.txt'} | Remove-Item


#7

Get-Item -Path 'c:\files'


#8
$SecurePassWord = ConvertTo-SecureString -String 'Pa55w0rd' -AsPlainText -Force

New-LocalUser -Name 'Gargamel' -Description 'asrael' -Password $SecurePassWord


New-LocalUser -Name 'BigSmurf' -Description 'asrael' -Password $SecurePassWord



#9 


Get-LocalUser | Where-Object {$PSItem.Description -eq 'Asrael'} | Disable-LocalUser

#10

Get-LocalUser | Where-Object {$PSItem.Description -eq 'Asrael'} | Enable-LocalUser

#11

Get-LocalUser | Where-Object {$PSItem.Description -eq 'Asrael'} | Remove-LocalUser




#8
$SecurePassWord = ConvertTo-SecureString -String 'Pa55w0rd' -AsPlainText -Force

New-ADuser -Name 'Gargamel' -Description 'asrael' -Password $SecurePassWord -Enabled $true


New-ADuser -Name 'BigSmurf' -Description 'asrael' -Password $SecurePassWord -Enabled $true



#9 


Get-ADuser -Filter * -Properties * | Where-Object {$PSItem.Description -eq 'Asrael'} | Disable-ADaccount

#10

Get-ADuser -Filter * -Properties * | Where-Object {$PSItem.Description -eq 'Asrael'} | Enable-ADaccount

#11

Get-ADuser -Filter * -Properties * | Where-Object {$PSItem.Description -eq 'Asrael'} | Remove-ADuser



#BONUS

New-ADOrganizationalUnit -Name 'moved'

$Ou_Old = 'OU=Moved,DC=Adatum,DC=com'
New-ADuser -Name 'Move1' -Description 'ok' -Password $SecurePassWord -Enabled $true -Path $Ou_Old

New-ADuser -Name 'Move2' -Description 'ok' -Password $SecurePassWord -Enabled $true -Path $Ou_Old

New-ADOrganizationalUnit -Name 'destination'

$Ou_New = 'OU=Destination,DC=Adatum,DC=com'
Get-ADuser -Filter * -Properties * | Where-Object {$psitem.Description -eq 'OK'} | move-ADobject -TargetPath $Ou_New
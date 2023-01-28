#1 + 2

'Geef een servicenaam en dan ga ikl hem stoppen of starten .'
$ServiceNaam= Read-Host 

$ServiceObject = Get-Service -Name $ServiceNaam

if($ServiceObject.Status -eq 'running')
{
    #1
    Stop-Service -Name $ServiceObject.Name

    #2
    #Stop-Service -InputObject $ServiceObject

    #3
   # Stop-Service -DisplayName $ServiceObject.DisplayName

    #4

    #Get-Service -Name $ServiceObject.Name | Stop-Service

    #5
    
    #Get-Service -DisplayName $ServiceObject.DisplayName | Stop-Service

    #6

    #Get-Service -InputObject $ServiceObject | Stop-Service

}

elseif($ServiceObject.Status -eq 'stopped')
{

    
      Get-Service -DisplayName $ServiceObject.DisplayName | Start-Service

}


$ServiceObject =Get-Service -Name $ServiceObject.Name

#$ServiceObject.Refresh() method hoef je nu niet te begrijpn

$ServiceObject


#3


'Geef een local user op '

$UserName = Read-Host

$UserObject = Get-LocalUser -Name $UserName


if($UserObject.Description -eq 'sales')
{


    Set-LocalUser -Name $UserObject.Name -Description 'support'


}

elseif($UserObject.Description -eq 'support')
{


    Set-LocalUser -Name $UserObject.Name -Description 'sales'


}


Get-LocalUser -Name $UserObject.Name



#4


'Geef een local user op '

$UserName = Read-Host

$UserObject = Get-LocalUser -Name $UserName


if($UserObject.Description -eq 'sales')
{
    'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

    $Answer =Read-Host

    if($Answer -eq 'j')
    {

        Set-LocalUser -Name $UserObject.Name -Description 'support'

    }

    elseif($Answer -eq 'n')
    {
        
        'Ok dan niet!!!!'


    }
}

elseif($UserObject.Description -eq 'support')
{


    'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

    $Answer =Read-Host

    if($Answer -eq 'j')
    {

        Set-LocalUser -Name $UserObject.Name -Description 'sales'

    }

    elseif($Answer -eq 'n')
    {
        
        'Ok dan niet!!!!'


    }


}




#BONUS OF JE HET SCRIPT WILT STARTEN JA OF NEE

'Weet je zeker of je het script wilt uitvoeren j/n ?'

$RunOrNot = Read-Host

if($RunOrNot -eq 'j')
{

    'Geef een local user op '

    $UserName = Read-Host

    $UserObject = Get-LocalUser -Name $UserName


    if($UserObject.Description -eq 'sales')
    {
        'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

        $Answer =Read-Host

        if($Answer -eq 'j')
        {

            Set-LocalUser -Name $UserObject.Name -Description 'support'

        }

        elseif($Answer -eq 'n')
        {
        
            'Ok dan niet!!!!'


        }
    }

    elseif($UserObject.Description -eq 'support')
    {


        'Weet je zeker dat je de beschrijving wilt aanpassen (j/n)'

        $Answer =Read-Host

        if($Answer -eq 'j')
        {

            Set-LocalUser -Name $UserObject.Name -Description 'sales'

        }

        elseif($Answer -eq 'n')
        {
        
            'Ok dan niet!!!!'


        }


    }

}

else
{


    'We voeren dit script niet uit !'


}

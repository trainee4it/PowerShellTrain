
'Wil je dit script uitvoeren j n '

$answer = Read-Host

if($answer -eq 'j')
{

    'Geef de naam van de localuser alsje en ik pas hem aan '

    $name = Read-Host

    $UserObject = Get-LocalUser -Name $name


    if($UserObject.description -eq 'sales')
    {
        'Hey wil jij de de user echt aanpassen ? j/n' 
        $Vraag = Read-Host
        if($Vraag -eq'j')
        {
            Set-LocalUser -Description 'support' -Name $UserObject.name

            Get-LocalUser -Name $UserObject.name | Set-LocalUser -Description 'support'

            $UserObject | Set-LocalUser -Description 'support'
        }

        else
        {

            'ok dan niet !!!!!'

        }
    }


    elseif($UserObject.description -eq 'support')
    {
        'Hey wil jij de de user echt aanpassen ? j/n' 
        $Vraag = Read-Host
        if($Vraag -eq'j')
        {
            Set-LocalUser -Description 'sales' -Name $UserObject.name

            Get-LocalUser -Name $UserObject.name | Set-LocalUser -Description 'sales'

            $UserObject | Set-LocalUser -Description 'sales'
        }

        else
        {

            'ok dan niet !!!!!'

        }

    }
   Get-LocalUser -Name $UserObject.Name
}

else
{


    'ok dan niet'

}



#1

'Hoe heet je ? '

$name = Read-Host

if($name -eq 'jouwvoornaam')
{


    'Welkom ' +$name

}

else
{


    'Ik ken je niet ' +$name

}



#2



'Hoe heet je ? '

$name = Read-Host

if($name -eq 'jouwvoornaam')
{


    'Welkom ' +$name

}

elseif($name -eq 'Piet')
{


    'Je moet je melden bij de directie ' +$name

}

else
{


    'Ik ken je niet ' +$name

}


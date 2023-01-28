$Answer = Read-Host

while($Answer -ne 'y' -and $Answer -ne 'n' )
{

    'please fill out yes or n'
    $Answer =Read-Host

}

if($Answer -eq 'y')
{

    'Geef de naam van de service alsje en ik geef de status '

    $name = Read-Host

    $ServiceObject = Get-Service -Name $name


    if($ServiceObject.Status -eq 'running')
    {

    
        ' De service ' + $ServiceObject.Name   +' is momenteel ' +$ServiceObject.Status 

          Stop-Service -Name $ServiceObject.Name
    }

    elseif($ServiceObject.Status -eq 'stopped')
    {

    
        ' De service ' + $ServiceObject.Name   +' is momenteel ' +$ServiceObject.Status 

          Start-Service -Name $ServiceObject.Name


    }
    Get-Service -Name $ServiceObject.Name
}

else
{


    'Ok you picked no'


}



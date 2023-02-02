


'Geef een local user op '

$UserName = Read-Host

$UserObject = Get-LocalUser -Name $UserName


if($UserObject.Description -eq 'sales')
{
    'Weet je zeker dat je de beschrijving wilt aanpassen van '+ $UserObject.Description + ' in support (j/n)'

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


    'Weet je zeker dat je de beschrijving wilt aanpassen van '+ $UserObject.Description + ' in sales (j/n)'

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


else 
{
        
    'De beschrijving is ' + $UserObject.Description

     'Wil je de beschrijving veranderen ?'

      $Answer = Read-Host
      if($Answer -eq 'j')
      {

        'Ok we veranderen hem '
         'Waarin wil je de beschrijving veranderen ?'
         $Description =Read-Host

         $UserObject | Set-Localuser -Description $Description

      }

      else 
      {
           

         "Ok dan niet !, de beschrijving blijft " + $UserObject.Description
        
        
      }
    
    
    
}

Get-LocalUser -Name $UserObject.Name
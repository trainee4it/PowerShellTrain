

#1 + 2

$Names = Get-Content 'C:\right\names.txt'

foreach($item in $Names )
{
    
    $SecurePassWord = ConvertTo-SecureString -String 'Pa55w.rd1234' -AsPlainText -Force

    New-LocalUser -Name $item -Password $SecurePassWord -Description 'smurfs'


}

#BONUS

$Names = Get-Content 'C:\right\names.txt'

foreach($item in $Names )
{
    
    
    if($item -eq 'Asrael')
    {
    
        $SecurePassWord = ConvertTo-SecureString -String 'ILoveG@rgamel1234' -AsPlainText -Force
    }
    
    else
    {
        
         $SecurePassWord = ConvertTo-SecureString -String 'Pa55w.rd1234' -AsPlainText -Force

    }
    
    
    New-LocalUser -Name $item -Password $SecurePassWord -Description 'smurfs'


}
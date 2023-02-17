#1

$array = @('C:\Verwijder1','C:\Verwijder2')

foreach($item in $array)
{


    New-Item -Path $item -ItemType Directory


}



#2
$array = @('C:\Verwijder1','C:\Verwijder2')
$Dirs = Get-ChildItem -Path 'c:\'

foreach($item in $Dirs)
{

    
    if($array -contains $item.FullName)
    {


        Remove-Item -Path $item.FullName

    }



}

#3


$array = @('C:\Verwijder1','C:\Verwijder2')

foreach($item in $array)
{


    New-Item -Path $item -ItemType Directory


}


#BONUS

$array = @('C:\Verwijder1','C:\Verwijder2')
$Dirs = Get-ChildItem -Path 'c:\'

foreach($item in $Dirs)
{

    
    if($array -contains $item.FullName)
    {
        
        ' Do you really want to remove (j/n)  ' + $item.FullName

        $Answer = Read-Host

        if($Answer -eq 'j')
        {

            Remove-Item -Path $item.FullName
        
        }

        else
        {

            'Ok will not remove ' + $item.FullName

        }
    
    
    }


}

$ar = @('C:\map1','C:\map2','C:\map3')


foreach($item in $ar)
{

    if(!(Test-path -Path $item))
    {

        
        New-Item -Path $item -ItemType Directory


    }




}
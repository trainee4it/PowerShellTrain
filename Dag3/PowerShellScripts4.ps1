#1+2

$Array = @('Jan','Klaas','Piet','Kees')

foreach($item in $Array)
{
    
    "Wat een leuke naam $item "


}


#3

$Names = Get-Content 'C:\right\namen.txt'

foreach($item in $Names )
{
    
    "Wat een leuke naam $item "


}

$array = @('servicebestaatniet1','spooler','servie','alg')

foreach($Item in $array)
{
    try
    {
    
        Get-Service -Name $Item -ErrorAction Stop

    }
    catch
    {
        
        $Item + ' bestaat niet ' + $Error[0].FullyQualifiedErrorId | Out-File -FilePath 'C:\log.txt' -Append  

    }


}

'Check your log file for errors '
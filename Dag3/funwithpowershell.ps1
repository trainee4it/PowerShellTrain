$name = 'Wecome to powershell'

for($i =0;$i -le $name.Length;++$i)
{


    Write-Host $name[$i] -ForegroundColor (Get-Random yellow,green) -NoNewline
    sleep -Milliseconds 100
}
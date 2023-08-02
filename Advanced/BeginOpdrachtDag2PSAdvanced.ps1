#1

function Check-Process
{


    param([string]$Name)

    $Started = $true
    try
    {


        $ProcessObject = Get-Process -Name $Name -ErrorAction Stop



    }

    catch
    {



        $Started = $false



    }



    $Started








}



#2a

function File-Picker2a
{


    param([string]$Name)

    Add-Type -AssemblyName system.windows.forms

    $OpenFile = New-Object System.Windows.Forms.OpenFileDialog

    $OpenFile.Filter = "txt files (*.txt)|*.txt|"

    $OpenFile.ShowDialog()

    $OpenFile.FileName



}



function File-Picker2b
{


    param([string]$Name)

    Add-Type -AssemblyName system.windows.forms

    $OpenFile = New-Object System.Windows.Forms.OpenFileDialog

    $OpenFile.Filter = "txt files (*.txt)|*.txt"

    $OpenFile.Multiselect = $true

    $OpenFile.ShowDialog()

    $OpenFile.FileNames



}


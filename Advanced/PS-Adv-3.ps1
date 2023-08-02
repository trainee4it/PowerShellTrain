#1

$SecurePassword = ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force
New-LocalUser -Name 'pino' -Password $SecurePassword


$SecurePassword = ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force
New-LocalUser -Name 'Grover' -Password $SecurePassword


function Check-LocalUser
{


    param([string]$Name)

    $Exists = $true


    try
    {


        $UserObject =    Get-LocalUser -Name $Name -ErrorAction Stop

    }

    catch
    {


        $Exists = $false
        

    }

    if($Exists)
    {

        
        $Properties = @{"Name"=$Name;"Exists"=$true}
        

    }

    else
    {

        
         $Properties = @{"Name"=$Name;"Exists"=$false}

        

    }


    $CustomObject = New-Object -TypeName psobject -Property $Properties
  
    
    $CustomObject



}


#3


$UsersToImport = Import-Csv -Path 'C:\users\userstoimport.csv'


foreach($item in $UsersToImport)
{

      
      Check-LocalUser -Name $item.NAAM

    


}
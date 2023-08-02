
function File-Picker
{

        Add-Type -AssemblyName system.windows.forms    $File = New-Object System.Windows.Forms.OpenFileDialog    $File.InitialDirectory = "C:\drivers"    $File.Filter = "csv files (*.csv)|*.csv|All files (*.*)|*.csv"    $result = $File.ShowDialog()         $File.FileName    }

function Check-OU
{


    param([string]$NameOfOu)

    $Exists = $True
    try
    {
        $OuObject = Get-ADOrganizationalUnit -Identity ('OU='+$NameOfOu +','+(Get-ADDomain).distinguishedname ) -ErrorAction Stop


    }

    catch
    {


        $Exists = $false


    }




    $Exists



}


function Check-CorrectOU
{
    
   param([string]$NameOfUser,[string]$OU)

   $userObject = Get-ADUser -Identity $NameOfUser
   $CorrectOU = $false
   if($userObject.DistinguishedName.split(',=')[3] -eq $OU)
   {


         
         $CorrectOU = $true

   }
   


   $CorrectOU


}

$ImportedUsers = Import-Csv -Path (File-Picker)

foreach($item in $ImportedUsers)
{

    $SamAccountName = $item.FIRSTNAME[0]  + '.' +$item.LASTNAME
    if(!(Check-CorrectOU -NameOfUser $SamAccountName -OU $item.DESCRIPTION))
    {

            Write-Verbose -Message (" User not in correct OU moving to " + $item.DESCRIPTION)  -Verbose 

            if(!(Check-OU -NameOfOu $item.DESCRIPTION))
            {

                New-ADOrganizationalUnit -Name $item.DESCRIPTION


            }

            Get-ADUser -Identity $SamAccountName | Move-ADObject -TargetPath ('OU='+$item.DESCRIPTION+','+(Get-ADDomain).Distinguishedname)

    }

    else
    {
        
         Write-Verbose -Message (" User is in correct OU moving to " + $item.DESCRIPTION)  -Verbose 
        

    }




}





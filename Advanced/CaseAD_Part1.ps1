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

function Check-ADuser
{
        
       param( [string]$Name)


       $Exists = $true

       try
       {


          $userobject=  Get-ADUser -Identity $Name -ErrorAction Stop


       }


       catch
       {

            $Exists = $false



       }


       $Exists




}


#MAIN



    $UsersToImport = Import-Csv -Path (File-Picker ) -ErrorAction Stop





foreach($Item in $UsersToImport)

{
 $SamAccountName = $Item.FIRSTNAME[0]+'.'+$Item.LASTNAME

    if(!(Check-ADuser -Name $SamAccountName))
    {
            
            $UserPrincipalname = $SamAccountName + '@' +(Get-ADDomain).Forest
            
            " User "  +$SamAccountName +  ' bestaat niet aanmaken '
            
            
            if(!(Check-OU -NameOfOu $item.DESCRIPTION))
            {


                    " OU "  + $item.DESCRIPTION +  ' bestaat niet aanmaken '

                    New-ADOrganizationalUnit -Name $Item.DESCRIPTION



            }



            $SecureString = ConvertTo-SecureString -String ' P@ssw0rd' -AsPlainText -Force
            New-ADUser -Name ($Item.FIRSTNAME[0]+'.'+$Item.LASTNAME) `
            -Path ('OU='+$item.DESCRIPTION+','+(Get-ADDomain).distinguishedname) -UserPrincipalName $UserPrincipalname `
            -SamAccountName $SamAccountName -AccountPassword $SecureString -Enabled $true


    }










}



#Extra regel niks te maken met het script zodat je makkelijk OUs kan wissen door Protect From Accidental Deletion uit te zetten

Get-ADOrganizationalUnit -Filter * | Set-ADOrganizationalUnit -ProtectedFromAccidentalDeletion $false

















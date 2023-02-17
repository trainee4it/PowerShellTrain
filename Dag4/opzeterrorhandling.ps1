$Exists = $True

try
{


    Get-ADOrganizationalUnit -Identity 'ou=support,dc=adatum,dc=com' -ErrorAction Stop

}

catch
{



    $exists = $false

}

if($Exists -eq $false)
{




}
function Get-LocalUserGroupMemberShips

{
    

    [Cmdletbinding()]

    param(

     [Parameter(Mandatory=$true,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]

     [string]$name



    )


        $Groups = Get-LocalGroup 

        foreach($group in $Groups)

        {
       


            if(Get-LocalGroupMember -Name $group.name | Where-Object {$_.Name -eq $env:COMPUTERNAME + '\' +$name})
            {


                $properties = [ordered]@{"UserName"=$name;"GroupName"=$group.Name}

                $object = New-Object -TypeName psobject -Property $properties
                $object
            }

       

       
       
       
        


        }

       if(!$object)
       {



        

                $properties = [ordered]@{"UserName"=$name;"GroupName"="NONE"}

                $object = New-Object -TypeName psobject -Property $properties
                $object
        



       }





}
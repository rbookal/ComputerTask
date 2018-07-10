Function addUser($userName, $pass, $descript)
{
    Write-Host("Adding Local User: $userName")
    try
    {
        $compName = $env:COMPUTERNAME
        $cn = [ADSI]"WinNT://$compName"
        $user = $cn.Create('User',$userName)
        $user.SetPassword($pass)
        $user.setinfo()
        $user.description = $descript
        $user.SetInfo()
    }
    catch
    {
        $_
    }
}
 
Function addToGroup($userName, $userGroup)
{
    Write-Host("Adding $userName to $userGroup...")
    try
    {
        $group = [ADSI]"WinNT://$env:COMPUTERNAME/$userGroup,group"
        $group.Add("WinNT://$env:COMPUTERNAME/$userName,user")
    }
    catch
    {
        $_
    }
}
 
Function RemoveUser($userName)
{
    Write-Host("Removing Local User...")
    try
    {
        $compName = $env:COMPUTERNAME
        $cn = [ADSI]"WinNT://$compName"
        $user = $cn.Delete("User", $userName)
    }
    catch
    {
        $_
    }
}
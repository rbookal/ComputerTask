<#
    .SYNOPSIS
        Set and Get password using PS AES 
    .DESCRIPTION
        TWO function
        SetPassword use to encrypt password
        UsePassword use to get the password 
    .Author 
    Rayon Bookal
#>

[CmdletBinding()]
Param (

)


Function SetPassword 
{

    #pwd that will save path
    $pwdFile = 'C:\pwd.txt'
    #AES file path
    $KeyFile = 'C:\keyfile.txt'

    $Key = New-Object Byte[] 32   # You can use 16, 24, or 32 for AES
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key)
    $Key | out-file $KeyFile

    
    $PlainPassword = Read-Host "Enter Password" -AsSecureString

    $PlainPassword | ConvertFrom-SecureString -Key (Get-Content $KeyFile) | Out-File $pwdFile
}

Function UsePassword
{
    $User = "MyUserName"
    $PasswordFile = "c:\pwd.txt"
    $KeyFile = "c:\keyfile.txt"
    $key = Get-Content $KeyFile
    $MyCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, (Get-Content $PasswordFile | ConvertTo-SecureString -Key $key)

 }




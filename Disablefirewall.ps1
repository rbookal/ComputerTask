Set-ExecutionPolicy -Force Bypass

#Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Set-NetFirewallProfile -Profile Domain,Private -Enabled False

Get-NetFirewallProfile | Format-List Name,Enabled 

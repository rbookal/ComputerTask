$links = ([xml](Invoke-WebRequest -Uri 'https://technet.microsoft.com/en-us/security/rss/bulletin' -Method Get).content).rss.channel.item 

#$url = "http://mirror.internode.on.net/pub/test/10meg.test"
#$output = "$PSScriptRoot\10meg.test"
#$start_time = Get-Date


foreach ($link in $links)
{
    Invoke-WebRequest -Uri $link.link -OutFile 'C:\Testing\download\'$link.title.Substring(0,8)
}
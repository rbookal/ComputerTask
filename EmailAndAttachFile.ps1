$fromaddress = "youremail@address.com"
$toaddress = "youremail@address.com" 
$Subject = "Reports" 
$body = "Monthly reports"
$attachment = "C:\temp\Capture.PNG" 
$attachment1 = "C:\temp\WSUSupdate.txt" 
$attachment2 = "C:\temp\WSUSupdate.txt" 
$smtpserver = "yoursmtpserver" 
 
#################################### 
 
$message = new-object System.Net.Mail.MailMessage 
$message.From = $fromaddress 
$message.To.Add($toaddress) 
$message.IsBodyHtml = $True 
$message.Subject = $Subject 
$attach = new-object Net.Mail.Attachment($attachment)
$attach1 = new-object Net.Mail.Attachment($attachment1)
$message.Attachments.Add($attach) 
$message.Attachments.Add($attach1) 
$message.body = $body 
$smtp = new-object Net.Mail.SmtpClient($smtpserver) 
$smtp.Send($message) 
 
#################################################################################
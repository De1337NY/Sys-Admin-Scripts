	#$credential = get-credential
    #$credential | Export-Clixml -path C:\secrets\emailcreds.xml

    $EmailTo = "ToNotify@email.com"
	$EmailFrom = "From@email.com"
    $credential = Import-Clixml -Path  C:\secrets\emailcreds.xml
	$Subject = "Blocked File was attempted to be created in Shares Directory"
	$Body = "A blocked file type was attempted to be created in the Shares. A detailed warning is available in the Event Log under WindowsLogs\Applications\Warning Source SRMSVC"
	$SMTPServer = "smtp.server.com"

Send-MailMessage -Credential $credential -to $EmailTo -From $EmailFrom -Subject $Subject -Body $Body -SmtpServer $SMTPServer -UseSsl -port 587
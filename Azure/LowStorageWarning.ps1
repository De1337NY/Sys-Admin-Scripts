For ($i=0; $i -le 0; $i++)

{
#stores any fixed local disks with less than 10% free space in $Report
$Report=Get-WmiObject win32_logicaldisk -Filter "Drivetype=3" -ErrorAction SilentlyContinue | Where-Object {($_.freespace/$_.size) -le '0.1'} #change this to change alert %

# Send Mail if $Report (<=10%) is true
If ($Report)
 
{
 
$EmailTo = "EMAIL@EMAIL.COM"
$EmailFrom = "EMAIL@EMAIL.COM"
$user = 'EMAIL@EMAIL.COM'
$password = 'hunter2'
$Subject = "Alert: Storage Low"
$Body = "Storage space has dropped to less than 10%"
$SMTPServer = "SMTPSERVER"
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$Subject,$Body)
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPClient.EnableSsl = $true
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential($user, $password)
$SMTPClient.Send($SMTPMessage)

}

Else 
#if not less than 10%, records free space and total size in txt output file
{
Get-Date -Format g | Out-File -FilePath C:\outfiles\diskspace.txt -Append
$disks = get-wmiobject -class "Win32_LogicalDisk" -Filter "Drivetype=3"
	$results = foreach ($disk in $disks)
	{
    	if ($disk.Size -gt 0)
    	{
       		 $size = [math]::round($disk.Size/1GB, 0)
       		 $free = [math]::round($disk.FreeSpace/1GB, 0)
       		 [PSCustomObject]@{
        	    Drive = $disk.Name
        	    Name = $disk.VolumeName
        	    "Total Disk Size" = $size
          	  "Free Disk Size" = "{0:N0} ({1:P0})" -f $free, ($free/$size)
        			}
    	}
	}
$results | Out-File -FilePath C:\outfiles\diskspace.txt -Append

}
 
}

$credential = Get-Credential

Connect-MsolService -Credential $credential

ForEach ($u in [System.IO.File]::ReadLines("C:\PATH\TO\FILE\EMAILS.txt"))
{
	Set-MsolUser -UserPrincipalName $u -PasswordNeverExpires $true
}

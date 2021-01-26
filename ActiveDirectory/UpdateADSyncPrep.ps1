#loads attributes into arrays of the same name from txt files
$samaccountname = Get-Content -Path 'C:\Scripts\samaccountname.txt'
$displayName = Get-Content -Path 'C:\Scripts\displayName.txt'
$givenName = Get-Content -Path 'C:\Scripts\givenName.txt'
$sn = Get-Content -Path 'C:\Scripts\sn.txt'
$mail = Get-Content -Path 'C:\Scripts\mail.txt'
$title = Get-Content -Path 'C:\Scripts\title.txt'
$department = Get-Content -Path 'C:\Scripts\department.txt'
$telephoneNumber = Get-Content -Path 'C:\Scripts\telephoneNumber.txt'
$proxyAddresses = Get-Content -Path 'C:\Scripts\proxyAddresses.txt'

#runs in a loop equal to the number of entries in the DisplayName txt file and updates all attributes 
for ($i=0; $i -le $displayName.count-1; $i++){
Get-ADUser -Identity $samaccountname[$i] | Set-ADUser -Replace @{displayName=$displayName[$i];givenName=$givenName[$i] ;sn=$sn[$i] ;mail=$mail[$i] ;proxyAddresses=$proxyAddresses[$i] ;title=$title[$i];department=$department[$i];telephoneNumber=$telephoneNumber[$i]}
}
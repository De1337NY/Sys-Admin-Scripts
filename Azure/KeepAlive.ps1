$IP = Get-Content -Path 'c:\scripts\ips.txt'

for ($i=0; $i -le $IP.count; $i++){
ping -n 2 $IP[$i]
}

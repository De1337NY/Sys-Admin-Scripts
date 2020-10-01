$IP = Get-Content -Path 'C:\scripts\ips.txt'

for ($i=0; $i -le $IP.count; $i++){
ping -n 2 $IP[$i]
}

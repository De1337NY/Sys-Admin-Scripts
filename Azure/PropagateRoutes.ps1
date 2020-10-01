Connect-AzAccount
#stores IPs and Names of routes from 2 separate txt files that are respectively organized
$IP = Get-Content -Path 'C:\Scripts\Azure\RoutesIP.txt'
$Name = Get-Content -Path 'C:\Scripts\Azure\RoutesName.txt'

#creates a new route for each IP and Name pair and ties it to the virtual appliance
for ($i=0; $i -le $IP.count; $i++){
Get-AzRouteTable | Add-AzRouteConfig -Name $Name[$i] -AddressPrefix $IP[$i] -NextHopType VirtualAppliance -NextHopIpAddress 'VIRTUALAPPLIANCEIPADDRESS' | Set-AzRouteTable
}

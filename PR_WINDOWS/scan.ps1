$Subnet = "192.168.0"
$LogFile = "network_scan_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"

"Початок сканування підмережі $Subnet.0/24..." | Out-File -FilePath $LogFile
"Час початку: $(Get-Date)" | Out-File -FilePath $LogFile -Append
"=========================================" | Out-File -FilePath $LogFile -Append

1..254 | ForEach-Object -Parallel {
    $ip = "$using:Subnet.$_"
    $log = $using:LogFile
    
    if (Test-Connection -ComputerName $ip -Count 1 -TimeoutSeconds 1 -Quiet -ErrorAction SilentlyContinue) {
        try {
            $hostEntry = [System.Net.Dns]::GetHostEntry($ip)
            $hostName = $hostEntry.HostName
        } catch {
            $hostName = "N/A"
        }
        
        $result = "IP: $ip `t| Hostname: $hostName"
        
        Write-Output $result
        $result | Out-File -FilePath $log -Append
    }
} -ThrottleLimit 20 

"=========================================" | Out-File -FilePath $LogFile -Append
"Сканування завершено." | Out-File -FilePath $LogFile -Append

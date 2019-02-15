#Remove WSUS data
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
$registryName = "UseWUServer"
$registryValue = "0"

Stop-Service -Name wuauserv

Set-ItemProperty -Path $registryPath\AU -Name $registryName -Value $registryValue
Remove-ItemProperty -Path $registryPath -Name "WUServer"
Remove-ItemProperty -Path $registryPath -Name "WUStatusServer"

Start-Service -Name wuauserv

#Install RSAT feature
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability –Online

#Get-VMSwitch
Write-Host "Список коммутаторов:"
Get-VMSwitch | ForEach-Object { Write-Host " - $_.Name" }
$switchName = Read-Host "Укажите комутатор (Список комутаторов Get-VMSwitch)"
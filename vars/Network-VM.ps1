#Get-VMSwitch
Write-Host "������ ������������:"
Get-VMSwitch | ForEach-Object { Write-Host " - $_.Name" }
$switchName = Read-Host "������� ��������� (������ ����������� Get-VMSwitch)"
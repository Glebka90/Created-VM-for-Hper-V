# Разрешить выполнение скриптов (если ещё не разрешено) 
# Set-ExecutionPolicy RemoteSigned -Scope CurrentUser


. ".\vars\Parms-VM.ps1"
. ".\vars\vhd.ps1"
. ".\vars\Network-VM.ps1"
. ".\vars\ISO-VM.ps1"


$memoryBytes = $memoryGB * 1GB
$vhdSizeBytes = $vhdSizeGB * 1GB



New-VHD -Path $vhdPath -SizeBytes $vhdSizeBytes -Dynamic
New-VM -Name $vmName -MemoryStartupBytes $memoryBytes -Generation 2 -VHDPath $vhdPath -SwitchName $switchName

Set-VMProcessor -VMName $vmName -Count $cpuCount

if ($isoPath -and (Test-Path $isoPath)) {
    Add-VMDvdDrive -VMName $vmName -Path $isoPath
    Set-VMFirmware -VMName $vmName -FirstBootDevice $(Get-VMDvdDrive -VMName $vmName)
    Set-VMFirmware -VMName $vmName -EnableSecureBoot On -SecureBootTemplate "MicrosoftUEFICertificateAuthority"
}

Start-VM -Name $vmName

Write-Host "Виртуальная машина $vmName создана и запущена"


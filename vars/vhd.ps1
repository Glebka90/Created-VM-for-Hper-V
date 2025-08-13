# Проверяем, существует ли папка

$vhdFolder = "D:\Hyper-V"

$vmFolder = Join-Path -Path $vhdFolder -ChildPath $vmName


if (-not (Test-Path $vmFolder)) {
        # Создать папку
        New-Item -ItemType Directory -Path $vmFolder 
        Write-Host "Папка '$vmName' создана"
}
 else {
    Write-Host "Папка '$vmFolder' уже существует."
}

$vhdPath = Join-Path $vmFolder "$vmName.vhdx"


$vhdFolder = "D:\Hyper-V"

$vmFolder = Join-Path -Path $vhdFolder -ChildPath $vmName

if (-not (Test-Path $vmFolder)) {
        # Ñîçäàòü ïàïêó
        New-Item -ItemType Directory -Path $vmFolder 
        Write-Host "Папка '$vmName' создана"
}
 else {
    Write-Host "Папка '$vmFolder' уже существует."
}

$vhdPath = Join-Path $vmFolder "$vmName.vhdx"



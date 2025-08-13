# ���������, ���������� �� �����

$vhdFolder = "D:\Hyper-V"

$vmFolder = Join-Path -Path $vhdFolder -ChildPath $vmName


if (-not (Test-Path $vmFolder)) {
        # ������� �����
        New-Item -ItemType Directory -Path $vmFolder 
        Write-Host "����� '$vmName' �������"
}
 else {
    Write-Host "����� '$vmFolder' ��� ����������."
}

$vhdPath = Join-Path $vmFolder "$vmName.vhdx"


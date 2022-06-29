$config=Get-Content ./env-variables.json -raw | ConvertFrom-Json
$Username=$config.v_vm_username

Write-Output "Installing Hyper-v and Containers features"
Enable-WindowsOptionalFeature -Online -FeatureName $("Microsoft-Hyper-V", "Containers") -All -NoRestart
Write-Output "Installing Chocolatey"
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
Write-Output "Installing wsl2 vscode notepadplusplus git"
choco install vscode notepadplusplus git -y
Write-Output "Installing wsl2"
choco install wsl -y
Write-Output "Docker"
choco install docker-desktop --pre -y
Write-Output "Adding User to Docker group"
Add-LocalGroupMember -Group "docker-users" -Member $Username
Write-Output "Restart PC"
Restart-computer



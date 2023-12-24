# Check if the script is running as an Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Error "Please run this script as an Administrator!"
    exit
}

# Check Windows version compatibility for WSL 2
$version = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
if ($version.BuildNumber -lt 18362) 
{
    Write-Error "WSL 2 requires Windows 10 version 1903 or higher with Build 18362 or higher."
    exit
}

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart

# Enable Windows Subsystem for Linux
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

# Install WSL 2 and Ubuntu distribution
wsl --install -d Ubuntu

# Set WSL default version to 2
wsl --set-default-version 2

# Prompt for system reboot
$reboot = Read-Host "System needs to restart to complete the installation. Would you like to reboot now? (Y/N)"
if ($reboot -eq 'Y' -or $reboot -eq 'y') 
{
    Restart-Computer
}
else 
{
    Write-Host "Please remember to reboot your system later to complete the installation."
}

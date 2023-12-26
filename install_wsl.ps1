# Download and execute a shell script using PowerShell
$scriptUrl = "https://raw.githubusercontent.com/zhk3r/wsl/master/ubuntu.sh"
$localScript = "$env:TEMP\ubuntu.sh"

# Download the script
Invoke-WebRequest -Uri $scriptUrl -OutFile $localScript

# Run the script in WSL
wsl sh -c "`$(cat $localScript)`"

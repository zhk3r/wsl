# Installing Windows Subsystem for Linux

Quick and simple way to get WSL up and running, paste into your Powershell:

<pre lang="shell">
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
</pre>

<pre lang="shell">
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
</pre>

<pre lang="shell">
wsl --set-default-version 2
</pre>

<pre lang="shell">
wsl --install -d Ubuntu
</pre>

# Setting up your shell and dependencies

After creating your username and password, simply copy-paste this into your Ubuntu terminal

<pre lang="bash">
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zhk3r/wsl/master/ubuntu.sh)"
</pre>

This installs zsh+omz, autosuggestions, syntax highlighting, check.sh and dependencies.

# Why does this exist?

This is just a supporting installation script / setup help for use with my check.sh, it sources the correct dependencies and adds the correct information to .zshrc. 

Probably not useful for anyone outside of my workplace.

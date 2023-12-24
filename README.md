# Installing Windows Subsystem for Linux

Enabling Hyper-V:

<pre lang="shell">
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
</pre>

Enabling Windows-Subsystem-for-Linux:

<pre lang="shell">
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
</pre>

Installing the standard Ubuntu/Linux distro:

<pre lang="shell">
wsl --install
</pre>

Setting the default WSL version to 2:

<pre lang="shell">
wsl --set-default-version 2
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

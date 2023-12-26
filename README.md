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

---

# Setting up your shell and dependencies

Now that you've installed a Linux distro you can launch it through Terminal using the *arrow-down* button.

After creating your UNIX username and password, simply copy-paste this into your Ubuntu terminal

<pre lang="bash">
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zhk3r/wsl/master/ubuntu.sh)"
</pre>

This install zsh+oms (our shell) autosuggestions and syntax autohighlighting, my check.sh function and all dependencies.

Type ```exec zsh``` to restart the shell to ensure everything went according to plan :)

---

## Why does this exist?

This is just a supporting installation script / setup help for use with my check.sh, it sources the correct dependencies and adds the correct information to .zshrc. 

Probably not useful for anyone outside of my workplace.

---

# Troubleshooting

**ERROR: If you can't enable WSL you're likely missing the WSL2 kernel:**
- [Download from Microsoft](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
- Requires a restart of your computer after install.
- Now you can enable WSL2 and start the Ubuntu distro.

Got any more issues? 

（︶^︶）

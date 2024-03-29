# Installing Windows Subsystem for Linux

## Using the script

[**Download wsl.ps1**](https://gitlab.group.one/christian-mathias.moen/wsl/-/raw/main/wsl.ps1?ref_type=heads&inline=false) then start PowerShell as Administrator and run the following command:

```powershell
Set-ExecutionPolicy Bypass -Scope Process; cd Downloads; ./wsl.ps1
```

## Using the manual method

Enabling Hyper-V:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
```

Enabling Windows Subsystem for Linux:

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Setting the default WSL version to 2:

```powershell
wsl --set-default-version 2
```

Installing the Ubuntu 22.04 distro:

```powershell
wsl --install -d Ubuntu-22.04
```

## Setting up Ubuntu

 **Here's how to up your game in 5 short steps!**

1) [Open this link in a new tab, CTRL+A and CTRL+C then CTRL+W.](https://gitlab.group.one/christian-mathias.moen/wsl/-/raw/main/install.sh?ref_type=heads)

2) Go to your Terminal and open Ubuntu and **type** the following command:

```shell
nano install.sh
```

3) Paste the content you copied above, 'Paste anyway' then press CTRL+S followed by CTRL+X to save and exit.

4) Copy-paste the following commands into your Terminal:

```shell
chmod +x install.sh && ./install.sh
```

5) Now just follow the on-screen instructions!

## Shorthand view of the repos

You can invoke the help sections by using the command with no arguments.

```
check           Quickly look up a relevant domain information
ssl             SSL Utility Suite for creating and troubleshooting SSL
toolkit         Other tools that can be useful (and some for flavor)
```

Type the command with no argument for help section, example: `ssl` or `check` or `toolkit`

## Pimping your Terminal

You can make your terminal look pretty sweet:

1) Download and install this font: <https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Lilex.zip>
2) Open this website and press Get Theme: <https://windowsterminalthemes.dev/?theme=tokyonight>

`Now the theme is copied to your clipboard:`

1. Press the down-arrow in your Terminal and press Settings --> Startup --> Default profile --> Your distro.
2. Settings --> Left corner, press Open JSON file --> CTRL+F 'schemes' --> Put your insert after the first `},`
2- Press Enter to make a new line and CTRL+V your theme and press `,` `[comma]` --> CTRL+S and exit your editor.
3. Settings --> Your distro --> Appearance --> Change colorscheme and font, adjust other settings as you please.

## Troubleshooting

**ERROR: If you can't make it past step 1 you're likely missing the WSL2 kernel:**

- [Download from Microsoft](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
- Requires a restart of your computer after install.
- Now you can enable WSL2 and start the Ubuntu distro.

**ERROR: That didn't work either?! Well try running the following command:**

```powershell
wsl.exe --update
```

Got any more issues?

（︶^︶）

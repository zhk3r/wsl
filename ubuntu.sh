#!/bin/bash

# Update package lists
sudo apt-get update

# Install necessary packages
sudo apt-get install -y whois curl openssl lolcat grc boxes zsh

# Change default shell to zsh
sudo chsh -s "$(which zsh)"

# Install Oh My Zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone check.sh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zhk3r/check/master/install.sh)"

# Clone zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Download the simple-path theme from the wsl repository
curl -fsSL https://raw.githubusercontent.com/zhk3r/wsl/main/simple-path.zsh-theme -o ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/simple-path.zsh-theme

# Modify .zshrc to include new plugins
sed -i '/plugins=(git)/a plugins=(zsh-syntax-highlighting)\nplugins=(zsh-autosuggestions)' ~/.zshrc

# Update ZSH_THEME in .zshrc to use 'simple-path'
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="simple-path"/' ~/.zshrc

# Apply changes to the current shell session
source ~/.zshrc

# Prompt to restart shell
read -p "Restart shell now? (y/n): " -n 1 -r
echo
if [[ \$REPLY =~ ^[Yy]$ ]]
then
    exec zsh
fi

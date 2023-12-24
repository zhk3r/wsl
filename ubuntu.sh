#!/bin/bash

# Update package lists
sudo apt-get update

# Install Python 3 and pip3
sudo apt-get install -y python3 python3-pip

# Install pip3 packages
pip3 install tabulate pip3 install colorama

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

# Set ZSH environment variable
export ZSH="$HOME/.oh-my-zsh"

# Update ZSH_THEME in .zshrc to use 'simple-path'
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="simple-path"/' ~/.zshrc

# Add pip3/tabulate path to .zshrc
pip3_path=$(pip3 show tabulate | grep Location | cut -d' ' -f2)
sed -i "/^export /a export PATH=\"\$PATH:$pip3_path\"" ~/.zshrc

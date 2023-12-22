#!/bin/bash

# Update package lists
sudo apt-get update

# Install necessary packages
sudo apt-get install -y whois curl openssl lolcat grc boxes zsh

# Change default shell to zsh
sudo chsh -s "$(which zsh)"

# Install Oh My Zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Run additional script from zhk3r repository
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zhk3r/check/master/install.sh)"

# Clone zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Clone zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Download the custom theme 'simple-path' from the repository
curl -fsSL -o ~/.oh-my-zsh/custom/themes/simple-path.zsh-theme https://raw.githubusercontent.com/zhk3r/repo/master/simple-path.zsh-theme

# Update ZSH_THEME in .zshrc to use 'simple-path'
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="simple-path"/' ~/.zshrc

# Apply changes to the current shell session
exec zsh

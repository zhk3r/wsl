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

# Modify .zshrc to include new plugins
sed -i '/plugins=(git)/a plugins=(zsh-syntax-highlighting)\nplugins=(zsh-autosuggestions)' ~/.zshrc

# Create custom theme file
cat << 'EOF' > ~/.oh-my-zsh/custom/themes/simple-path.zsh-theme
# Determine CARETCOLOR based on whether the user is root or not
if [ "\$USER" = "root" ]; then
    CARETCOLOR="red"
else
    CARETCOLOR="blue"
fi

# Configuration for return code display
local return_code="%(\?..\%{\$fg[red]%}%? ↵%\{\$reset_color%})"

# Configure PROMPT with colored timestamp, username, and other elements
PROMPT='%{\${fg_bold[yellow]}%}[%D{%H:%M:%S}] %{\${fg_bold[magenta]}%}%n%{\${fg_bold[cyan]}%} \$ %{\${fg_bold[green]>'

# Set the right prompt to display vi mode and return code
RPS1='$(vi_mode_prompt_info) \${return_code}'

# Git prompt configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{\$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{\$reset_color%}"

# Configuration for mode indicator
MODE_INDICATOR="%{\$fg_bold[magenta]%}<%{\$reset_color%}%{\$fg[magenta]%}<<%{\$reset_color%}"
EOF

# Correcting the issue with the custom theme script in .zshrc
sed -i '/^source \$ZSH\/oh-my-zsh.sh/a \# Custom theme configuration\nsource ~/.oh-my-zsh/custom/themes/simple-path.theme-zsh-theme' ~/.zshrc

# Apply changes to the current shell session
source ~/.zshrc

# Restart shell to apply changes
exec zsh
exec bash -l

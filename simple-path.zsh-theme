# Determine CARETCOLOR based on whether the user is root or not
if [ "$USER" = "root" ]; then
    CARETCOLOR="red"
else
    CARETCOLOR="blue"
fi

# Configuration for return code display
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# Configure PROMPT with colored timestamp, username, and other elements
PROMPT='%{${fg_bold[yellow]}%}[%D{%H:%M:%S}] %{${fg_bold[magenta]}%}%n%{${fg_bold[cyan]}%} $ %{${fg_bold[green]}%}%~ $(git_prompt_info)%{${fg_bold[$CARETCOLOR]}%}'

# Set the right prompt to display vi mode and return code
RPS1='$(vi_mode_prompt_info) ${return_code}'

# Git prompt configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

# Configuration for mode indicator
MODE_INDICATOR="%{$fg_bold[magenta]%}<%{$reset_color%}%{$fg[magenta]%}<<%{$reset_color%}"

# Future TODO: Use 265 colors for mode indicator
#MODE_INDICATOR="$FX[bold]$FG[020]<$FX[no_bold]%{$fg[blue]%}<<%{$reset_color%}"

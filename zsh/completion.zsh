# Matches case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Allows for pasted commands to use autocomplete
zstyle ':completion:*' insert-tab pending

# Sets autocomplete colors to use LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Highlight the background of autocompleted values
zstyle ':completion:*' menu select

source /usr/local/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

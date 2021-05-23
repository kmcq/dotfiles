fzf_location=~/.fzf
if [[ "$(uname -s)" == "Darwin" ]]
then
  fzf_location=$(brew --prefix)/opt/fzf
fi

# Setup fzf
# ---------
if [[ ! "$PATH" == *$fzf_location/bin* ]]; then
  export PATH="$PATH:$fzf_location/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *$fzf_location/man* && -d "$fzf_location/man" ]]; then
  export MANPATH="$MANPATH:$fzf_location/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzf_location/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$fzf_location/shell/key-bindings.zsh"

# Configuration Options
# ---------------------
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git/*'"

unset fzf_location

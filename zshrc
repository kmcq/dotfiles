### EDITOR ###
export VISUAL=vim
export EDITOR=$VISUAL

### FUNCTIONS ###

# No arguments: `git status`
# With arguments: acts like `git`
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

### VARIABLES ###
export ANDROID_HOME=~/Library/Android/sdk

### PATH ###
PATH="$HOME/.bin:/usr/local/sbin:$PATH"
PATH="$PATH:$HOME/.rvm/bin"
PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"
export -U PATH

### ALIASES ###
[[ -f ~/.aliases ]] && source ~/.aliases

### KEY BINDINGS ###
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

### PROMPT ###
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}
setopt promptsubst
PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '

### UNIX ###
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ls="ls -G"
alias l='ls'
alias ll='ls -al'
alias vi='vim'
alias v='nvim'

### SHORTCUTS ###
alias src='cd ~/src/'
alias todo='vim ~/Dropbox/todo/'
alias notes='todo'

### DEV TOOLS ###
alias now="vercel"

### GIT ###
alias g="git"
alias gb="git recent"
alias gp="git pull"
alias gs="git status"
alias gpr="git pull --rebase"
alias gpu="git push -u"
alias gpuf="git push -f"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gsave="git stash save -a"
alias gbackone="git reset HEAD~ && git status"
alias gll="git log --name-status"
alias gd="git diff"
alias gdc="git diff --cached"
alias glnh="git log --pretty=format:'%Cred%h%Creset -%C(bold yellow)<%an> %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --date=relative --abbrev-commit --graph --no-merges"
alias gl="echo && git branch && echo && glnh -10"
alias standup='git log --author="`git config user.name`" --since="1 day ago"'

### TMUX ###
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'
# alias tk='tmux kill-session -t'

### EXTRAS ###

# ctags fix. OSX ctags is bad - this forces use of brew's ctags
if [[ "$(uname -s)" == "Darwin" ]]
then
  alias ctags="`brew --prefix`/bin/ctags"
fi

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

### GITHUB ###

alias gh-presto='presto --server presto-coordinator.service.github.net:8080'
alias gh-presto-export='gh-presto --output-format CSV_HEADER -f'

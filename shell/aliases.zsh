### UNIX ###
alias tlf="tail -f"
alias ln='ln -v'
alias mkdir='mkdir -p'
alias ls="ls -G"
alias l='ls'
alias ll='ls -al'
alias vi='vim'
alias v='vim'

### SHORTCUTS ###
alias src='cd ~/src/'
alias yei='src && cd YEI-Rails'
alias todo='vim ~/Dropbox/todo/'
alias notes='todo'

### DEV TOOLS ###
alias s="bundle exec rspec"
alias karma='node_modules/.bin/karma start --browsers Chrome'

### GIT ###
alias gb="git branch"
alias gp="git pull"
alias gpr="git pull --rebase"
alias gpu="git push"
alias gpuf="git push -f"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gsave="git stash save -u"
alias gbackone="git reset HEAD~ && git status"
alias gll="git log --name-status"
alias gd="git diff"
alias gdc="git diff --cached"
alias glnh="git log --pretty=format:'%Cred%h%Creset -%C(bold yellow)<%an> %C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --date=relative --abbrev-commit --graph --no-merges"
alias gl="git branch && glnh | head -10"
alias standup='git log --author="`git config user.name`" --since="1 day ago"'

### TMUX ###
alias tn='tmux new -s'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux ls'

### EXTRAS ###

# ctags fix. OSX ctags is bad - this forces use of brew's ctags
alias ctags="`brew --prefix`/bin/ctags"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
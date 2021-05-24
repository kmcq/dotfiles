case "$(uname -s)" in
  Darwin)
    export PATH="/usr/local/bin:$PATH"
    ;;

  Linux)
    export PATH="$HOME/.nodenv/bin:$PATH"
    export PATH="$HOME/.rbenv/bin:$PATH"
    ;;
esac

export PATH="$ZSH/bin:$PATH"
export PATH="./bin:$PATH"
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:/usr/local/opt/mysql@5.7/bin"
export PATH="$HOME/go/bin:$PATH"

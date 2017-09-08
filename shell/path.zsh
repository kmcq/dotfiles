case "$(uname -s)" in
  Darwin)
    export PATH="/usr/local/heroku/bin:$PATH"
    export PATH="/usr/local/bin:$PATH"
    ;;

  Linux)
    export PATH="$HOME/.linuxbrew/bin:$PATH"
    ;;
esac

export PATH="$ZSH/bin:$PATH"
export PATH="./bin:$PATH"
export PATH="$HOME/.bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}"
export PATH="$PATH:$HOME/.yarn/bin"
export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:/usr/local/Cellar/node@6/6.9.1/bin"

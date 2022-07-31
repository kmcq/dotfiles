#!/bin/bash

if [ ! -f ~/.gnupg/gpg-agent.conf ]
then
  gpg --list-keys > /dev/null
  echo "pinentry-program $(which pinentry-mac)" > "$HOME/.gnupg/gpg-agent.conf"
  killall gpg-agent
fi

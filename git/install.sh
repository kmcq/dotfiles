#!/bin/bash

if [ ! -f ~/.gnupg/gpg-agent.conf ]
then
  gpg --list-keys > /dev/null
  echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
  killall gpg-agent
fi

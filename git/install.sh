#!/bin/bash

if [ "$(uname -s)" == "Darwin" ]
then
  echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
  killall gpg-agent
fi

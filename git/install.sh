#!/bin/bash

if [ "$(uname -s)" == "Darwin" ]
then
  echo "pinentry-program /usr/local/bin/pinentry-mac" >> ~/.gnupg/gpg-agent.conf
  killall gpg-agent
else
  # We won't have delta, so just alias it to less
  alias delta="less"
fi

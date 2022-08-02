#!/bin/bash

set -e

gpg --full-generate-key

user ' - What is your GPG signing key? (Run `gpg --list-keys`)'
read -e gpg_signing_key
git config --global user.signingkey "$gpg_signing_key"

if [ ! -f ~/.gnupg/gpg-agent.conf ]
then
  gpg --list-keys > /dev/null
  echo "pinentry-program $(which pinentry-mac)" > "$HOME/.gnupg/gpg-agent.conf"
  killall gpg-agent
fi

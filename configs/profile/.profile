# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true

# Start in-memory storage of SSH passphrases
if [ -z "$SSH_AUTH_SOCK" ]; then
  eval `ssh-agent -s`
fi
trap 'test -n "$SSH_AUTH_SOCK" && eval `/usr/bin/ssh-agent -k`' 0

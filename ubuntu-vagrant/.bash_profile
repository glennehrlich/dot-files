#~/usr/bin/env bash

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# Swap alt and win keys.
if dpkg -l ubuntu-desktop > /dev/null 2>&1; then
    setxkbmap -option altwin:swap_alt_win
fi

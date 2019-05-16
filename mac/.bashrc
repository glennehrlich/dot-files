#!/usr/bin/env bash

# Prompt settings.
export PROMPT_COMMAND="history -a"
export PS1="\n\u@\h:\w\n\\$ \[$(tput sgr0)\]"

# History settings
export HISTCONTROL=ignoreboth
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s cmdhist
shopt -s histappend

export HISTIGNORE="\
alias:\
clear:\
e:\
exit:\
export TERM=xterm-256color:\
h:\
ls:\
"

export PATH=\
.:\
~/bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin

export MANPATH=\
/usr/local/share/man:\
$MANPATH

export EMACS=/usr/local/bin/emacs
export EDITOR=$EMACS
export VISUAL=$EMACS

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

alias e="$EMACS &"
alias emacs=$EMACS
alias h=history
alias ls='ls -FG'
alias vd='vagrant halt'
alias vgs='vagrant global-status'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vus='vagrant up ; vagrant ssh'


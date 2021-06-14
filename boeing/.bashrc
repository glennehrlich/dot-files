#!/usr/bin/env bash

# Source the original ubuntu .bashrc.
source ~/dot-files/boeing/.bashrc.ubuntu

# Prompt settings.
export PROMPT_COMMAND="history -a"

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

export EMACS=emacs
export EDITOR=$EMACS
export VISUAL=$EMACS

alias e="$EMACS &"
alias gl='git log --graph --oneline --decorate'
alias h=history
alias ls='ls --color -FG'

# vterm integration support; from vterm README.md
vterm_printf(){
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ] ); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    function clear(){
        vterm_printf "51;Evterm-clear-scrollback";
        tput clear;
    }
fi

vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
    PS1=$PS1'\[$(vterm_prompt_end)\]'
fi

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

export PATH=/opt/idea/bin:$PATH

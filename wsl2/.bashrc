#!/usr/bin/env bash

# Prompt settings.
export PROMPT_COMMAND="history -a"
# export PS1="\n\u@\h:\w\n\\$ "
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

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

# export NO_AT_BRIDGE=1

alias e="$EMACS &"
alias h=history
alias ls='ls --color -FG'
alias mg="pushd ~ ; mgitstatus -d 0 ; popd"

if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

# Rewrite cd so that directory tracking works in vterm.
cd() {
  builtin cd "$@" || return
  [ "$OLDPWD" = "$PWD" ] || echo -e "\e]51;A$(pwd)\e\\"
}

# vterm integration support; from vterm README.md
vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
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
PS1=$PS1'\[$(vterm_prompt_end)\]'

export DISPLAY=$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}'):0.0

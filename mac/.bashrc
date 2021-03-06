#!/usr/bin/env bash

# Prompt settings.
export PROMPT_COMMAND="history -a"
export PS1="\n\u@\h:\w\n\\$ "

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
/usr/local/sbin:\
~/opt/anaconda3/bin:\
~/.local/bin:\
/usr/bin:\
/bin:\
/usr/sbin:\
/sbin:\
/opt/X11/bin:\
/Library/Frameworks/Mono.framework/Versions/Current/bin

export MANPATH=\
/usr/local/share/man:\
$MANPATH

export EMACS=/usr/local/bin/emacs
export EDITOR=$EMACS
export VISUAL=$EMACS

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# powerline-daemon -q
# POWERLINE_BASH_CONTINUATION=1
# POWERLINE_BASH_SELECT=1
# . ~/.local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh 

alias e="$EMACS &"
alias emacs=$EMACS
alias gp="git_push.sh"
alias gs="git_status.sh"
alias h=history
alias k=kubectl
alias ls="ls -FG"
alias vd="vagrant halt"
alias vgs="vagrant global-status"
alias vs="vagrant ssh"
alias vu="vagrant up"
alias vus="vagrant up ; vagrant ssh"

# Make completion work on some aliases.
complete -F __start_kubectl k

# Rewrite cd so that directory tracking works in vterm.
cd() {
  builtin cd "$@" || return
  [ "$OLDPWD" = "$PWD" ] || echo -e "\e]51;A$(pwd)\e\\"
}

export PYTHONPATH=\
~/gitlab/kinetx_muos/sim/lib

# vterm integration support; from vterm README.md
function vterm_printf(){
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

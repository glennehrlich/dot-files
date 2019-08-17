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

# DISPLAY for displaying x11 clients on host computer.
if dpkg -l ubuntu-desktop > /dev/null 2>&1; then
    export DISPLAY=:0             # if running in ubuntu desktop
else 
    export DISPLAY=localhost:10.0 # if running under ssh'd x11
fi

# Turn off accessibility errors and libGL errors when launching X11
# applications.
export NO_AT_BRIDGE=1

# Make sure dbus vars are exported so that some dbus-oriented programs
# like gnome-terminal and gnome-system-monitor work correctly.
export $(dbus-launch)

if [[ -e /usr/local/bin/emacs ]]; then
    export EMACS=/usr/local/bin/emacs
elif which emacs; then
    export EMACS=`which emacs`
fi

export EDITOR=$EMACS
export VISUAL=$EMACS

alias e="emacs &"
alias h=history
alias ls='ls --color -FG'

if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

export PATH=\
~/bin:\
/opt/conda/bin:\
$PATH

# These are not necessary as scripts now by directly setting sys.path,
# however these are necessary for emacs to find definitions. If I
# start getting unexpected results, like picking up weird versions of
# code, then comment this out.
export PYTHONPATH=\
~/gitlab/kinetx_simulation/python:\
~/gitlab/kinetx_simulation/python-devs:\
~/gitlab/kinetx_forks/PythonPDEVS/src

# Set the vm variables if the vm files exist.
if [[ -e /vagrant/VM_HOME.txt ]]; then
    export VM_HOME=`cat /vagrant/VM_HOME.txt`
fi
if [[ -e /vagrant/VM_REPO.txt ]]; then
    export VM_REPO=`cat /vagrant/VM_REPO.txt`
fi

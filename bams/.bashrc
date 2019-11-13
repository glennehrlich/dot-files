#!/bin/bash

# Prompt settings.
export PROMPT_COMMAND="history -a"
export PS1='\n\u@\h:\w\n$ '

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
export DISPLAY=localhost:10.0

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

# Set permisions to:
# dir:  rwxrwxrwx
# file: rw-rw-rw-
umask 0

export PATH=\
~/bin:\
$PATH

# To properly build the bar application using apache ant as installed
# with provision_ant.sh, we need to set ANT_HOME so all the ant
# infrastructure works correctly.
export ANT_HOME=/opt/ant

# If we installed scl, then set it up.
if /usr/bin/which scl_source > /dev/null 2>&1; then
    # Make sure the extra python stuff in rh is enabled.
    source scl_source enable python27

    # Make sure the python path for anaconda development is set.
    export PYTHONPATH=/usr/lib64/python2.7/site-packages:/usr/lib/python2.7/site-packages:$PYTHONPATH
fi

# Set the vm variables if the vm files exist.
if [[ -e /vagrant/VM_HOME.txt ]]; then
    export VM_HOME=`cat /vagrant/VM_HOME.txt`
fi
if [[ -e /vagrant/VM_REPO.txt ]]; then
    export VM_REPO=`cat /vagrant/VM_REPO.txt`
fi

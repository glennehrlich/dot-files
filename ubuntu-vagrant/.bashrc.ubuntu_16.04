#!/bin/bash

# History settings
export HISTFILESIZE=10000
export HISTSIZE=10000
shopt -s cmdhist
shopt -s histappend

# Prompt will look like this:
# 
# vagrant:~
# $ <cursor here>
# export PS1='\n\h:\w\n$ '

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

export EMACS=/usr/bin/emacs
export EDITOR=$EMACS
export VISUAL=$EMACS

alias e="emacs &"
alias h=history
alias ls='ls --color -FG'

if [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
fi

export PATH=\
~/r/bin:\
~/gitlab/kinetx_simulation/util/bin:\
$PATH

# These are not necessary as scripts now by directly setting sys.path,
# however these are necessary for emacs to find definitions. If I
# start getting unexpected results, like picking up weird versions of
# code, then comment this out.
export PYTHONPATH=\
~/gitlab/kinetx_simulation/python:\
~/gitlab/kinetx_simulation/python-devs:\
~/gitlab/kinetx_forks/PythonPDEVS/src

# Keep this comment in order to make sure the file ends properly.
PATH=/opt/anaconda/bin:$PATH

# Set the vm variables if the vm files exist.
if [[ -e /vagrant/VM_HOME.txt ]]; then
    export VM_HOME=`cat /vagrant/VM_HOME.txt`
fi
if [[ -e /vagrant/VM_REPO.txt ]]; then
    export VM_REPO=`cat /vagrant/VM_REPO.txt`
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

PROMPT_COMMAND="printf '\n'"
export PS1="\h:\w\n$ "

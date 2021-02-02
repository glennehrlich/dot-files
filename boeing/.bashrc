# .bashrc

# define gvim as my editor
export EDITOR=gvim

# Source global definitions
if [ -f /etc/bashrc ]; then
   . /etc/bashrc
fi

if [ -f ~/.bash_functions ]; then
   . ~/.bash_functions
fi

if [ -f ~/.bashrc_personal ]; then
   . ~/.bashrc_personal
fi

export JDK_1_7_HOME=/usr/java/jdk1.7.0_80
export JDK_1_8_HOME=/usr/java/jdk1.8.0_144
export JAVA_HOME=${JDK_1_8_HOME}
export TOMCAT_HOME=$HOME/local/apache-tomcat
export TOMCAT_HOME=$HOME/local/apache-tomcat
export CATALINA_HOME=$TOMCAT_HOME
export ACTIVEMQ_URL="tcp://localhost:61616"
export ANT_HOME=/opt/apache-ant
export M2_HOME=/opt/apache-maven
export ACTIVEMQ_HOME=/opt/apache-activemq
export SOAPUI_HOME=/opt/SoapUI


addPath ${M2_HOME}/bin
addPath ${ACTIVEMQ_HOME}/bin
addPath ${ANT_HOME}/bin
addPath ${SOAPUI_HOME}/bin 
addPath /opt/cisco/vpn/bin
addPath /opt/cisco/anyconnect/bin
alias vpn=/opt/cisco/anyconnect/bin/vpnui
# note /local/eclipse is a symbolic link. Change it to
# point to a different eclipse verision if you like
addPath $HOME/local/eclipse
addPath $HOME/local/netbeans/bin
addPath $HOME/local/apache-tomcat/bin

# Environment variables for AGS code install
export AGS_HOME=${HOME}/projects/ags/code
export AGS_SERVICES=${AGS_HOME}/AGS-SERVICES
export DOCKER_SERVICES=${AGS_SERVICES}/DockerServices
export AGS_DB=${AGS_HOME}/AGS-DB
export AGS_HMI=${AGS_HOME}/AGS-HMI

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
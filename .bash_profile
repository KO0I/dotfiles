#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] #&& exec startx

export QSYS_ROOTDIR="/home/patrick/build/quartus-free/src/home/patrick/bin/altera/16.0/quartus/sopc_builder/bin"

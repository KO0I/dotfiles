#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] #&& exec startx

export QSYS_ROOTDIR="/home/amber/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"

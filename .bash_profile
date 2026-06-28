#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] #&& exec startx

export QSYS_ROOTDIR="/home/$USER/build/quartus-free/src/home/$USER/bin/altera/16.0/quartus/sopc_builder/bin"
# Add .NET Core SDK tools
export PATH="$PATH:/home/amber/.dotnet/tools"

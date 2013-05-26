#
# ~/.bash_profile
#

ponysay --ponyonly -f rainbowfly
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

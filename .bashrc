#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# git bash completion
source /usr/share/git/completion/git-completion.bash

# modified commands - utilities
alias diff='colordiff' 				# requires colordiff package
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias v='vim'
alias gitshove='git push -u origin master'
alias pacman-orphan='sudo pacman -Rns $(pacman -Qtdq)'
alias vino='vim src/sketch.ino'
#alias pacmod='sudo pacman -Qii | awk '/^MODIFIED/ \{print $2\}''
# crude but effective reset of wireless
alias netctl-restart='sudo systemctl restart netctl-auto@wlan0.service'
# lists all modified files (for backing up)
#alias pacman-mod='sudo pacman -Qii | awk \' /^MODIFIED/ {print $2}\' '
# aliases that make games easier
alias ksp='~/games/KSP_linux/KSP.x86_64'
alias starcraft='/home/patrick/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft\ II/StarCraft\ II.exe'
alias netctlstop='sudo systemctl stop netctl-auto@wlan0.service'
# for Ino (Arduino)
alias inobus='ino build && ino upload && ino serial'
alias inobu='ino build && ino upload'
alias inob='ino build'



# aliases for ECEN stuff
alias quartus64='/opt/altera/13.0sp1/quartus/bin/quartus --64bit'
alias modelsim='/opt/altera/13.0sp1/modelsim_ase/bin/vsim'
alias ltspice='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/LTC/LTSpiceIV/scad3.exe'

# Custom PS1
# Checks for 256 color terminal
if [ -t 1 ]; then

	ncolors=$(tput colors)
	if ( test -n "$ncolors" && test $ncolors -ge 256 ); then
		export PS1='\[\033[38;05;33m\]\u\[\033[0m\]@\[\033[38;05;76m\]\h \[\033[38;05;245m\]\W\[\033[38;05;33m\] >>\[\033[0m\] '
	elif ( test -n "$ncolors" && test $ncolors -ge 8 ); then
		export PS1='\[\e[0;35m\]\u\[\e[m\]@\[\e[3;32m\]\h \[\e[m\]\W \[\e[0;34m\]>>\[\e[m\] '
	else
		export PS1='\u@\h \W >> '
	fi
fi

export EDITOR="vim"

# remove all previous duplicates in command history before saving the current one
export HISTCONTROL="erasedups"
export HISTFILESIZE=2500

#export PATH="~/bin:$PATH"
export PATH="~/bin:~/scripts:~/games/KSP_Linux:/opt/altera/13.0sp1/quartus/bin:$PATH"

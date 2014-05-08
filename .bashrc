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
  alias python='python2'
#alias pacmod='sudo pacman -Qii | awk '/^MODIFIED/ \{print $2\}''

# crude but effective reset of wireless
  alias nr='sudo systemctl restart netctl-auto@wlan0.service'
  # lists all modified files (for backing up)
  #alias pacman-mod='sudo pacman -Qii | awk \' /^MODIFIED/ {print $2}\' '
  # aliases that make games easier
  alias ksp='~/games/KSP_linux/KSP.x86_64'
  #alias starcraft='/home/patrick/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft\ II/StarCraft\ II.exe'
  alias armada2='wine /home/patrick/.wine/drive_c/Program\ Files/Activision/Star\ Trek\ Armada\ II/Armada2.exe'
  alias netctlstop='sudo systemctl stop netctl-auto@wlan0.service'
# for Ino (Arduino)
  alias inobus='ino build && ino upload && ino serial'
  alias inobu='ino build && ino upload'
  alias inob='ino build'
# for Android
  alias mntmtp='mkdir /home/patrick/mtp && jmtpfs /home/patrick/mtp'
  alias umntmtp='fusermount -u /home/patrick/mtp && rmdir /home/patrick/mtp'

# aliases for ECEN stuff
  alias quartus64='/home/patrick/altera/13.0sp1/quartus/bin/quartus --64bit'
  alias altera-monitor='/home/patrick/altera/13.0sp1/University_Program/Monitor_Program/bin/altera-monitor-program'
  alias modelsim='/home/patrick/altera/13.0sp1/modelsim_ase/bin/vsim'
  alias ltspice='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/LTC/LTSpiceIV/scad3.exe'
  alias 4nec2='wine ~/.wine/drive_c/4nec2/exe/4nec2.exe'
  alias falstad='java -jar ~/build/falstad/circuit.jar'
# for MATLAB
  alias matp='/usr/local/MATLAB/R2013b/bin/matlab -nosplash -nodisplay -nodesktop'
  alias matlab='/usr/local/MATLAB/R2013b/bin/matlab'
# for Mathematica in Command Line
  alias mathmp='/opt/Wolfram/Mathematica/9.0/Executables/MathKernel'
# for nios2-gcc
  alias nios2-gcc='/home/patrick/altera/13.0sp1/nios2eds/bin/gnu/H-i686-pc-linux-gnu/bin/nios2-elf-gcc'

# Custom PS1
# Checks for 256 color terminal
if [ -t 1 ]; then

	ncolors=$(tput colors)
	if ( test -n "$ncolors" && test $ncolors -ge 256 ); then
		export PS1='\[\033[38;05;197m\]\u\[\033[0m\]@\[\033[38;05;214m\]\h \[\033[38;05;245m\]\W\[\033[38;05;197m\] >>\[\033[0m\] '
	elif ( test -n "$ncolors" && test $ncolors -ge 8 ); then
		export PS1='\[\e[1;34m\]\u\[\e[m\]@\[\e[3;214m\]\h \[\e[m\]\W \[\e[0;197m\]>>\[\e[m\] '
	else
		export PS1='\u@\h \W >> '
	fi
fi

#Colorize
man() 
  {
  env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# Some little helper functions to quickly convert numbers between bases
# Hex to Decimal
h2d(){
  echo "ibase=16; $@"|bc
}
# Hex to Binary
h2b(){
  echo "ibase=16; obase=2; $@"|bc
}

# Decimal to Hex
d2h(){
  echo "obase=16; $@"|bc
}
# Decimal to Binary
d2b(){
  echo "obase=2; $@"|bc
}

# Binary to Hex
b2h(){
  # Note that there is a quirk about bc where if ibase<obase, the order needs
  # to be swapped as seen below, or the conversion is invalid!
  echo "obase=16; ibase=2; $@"|bc
}
# Binary to Decimal
b2d(){
  echo "ibase=2; $@"|bc
}

export EDITOR="vim"

# remove all previous duplicates in command history before saving the current one
export HISTCONTROL="erasedups"
export HISTFILESIZE=2500

#export PATH="~/bin:$PATH"
#export PATH="~/bin:~/scripts:/opt/altera/13.0sp1/quartus/bin:$PATH"
export PATH="~/bin:~/scripts:~/games/KSP_Linux:/opt/altera/13.0sp1/quartus/bin:/opt/Wolfram/Mathematica/9.0/Executables:$PATH"

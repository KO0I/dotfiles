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
  #alias changed-files='sudo pacman -Qii | awk '/^MODIFIED/ {print $2}''
  alias vino='vim src/sketch.ino'
  alias python='python2'
#alias pacmod='sudo pacman -Qii | awk '/^MODIFIED/ \{print $2\}''

# Launch Encrypted Messaging
alias signalapp='/usr/bin/chromium --profile-directory=Default --app-id=bikioccmkafdpakkkcpdbppfkghcmihk'

#For German Translations
alias e2d='trans -b :de $@' 
alias d2e='trans -b :en $@' 

# For DWM
alias redwm='cd ~/dwm; updpkgsums; makepkg -fi --noconfirm; killall dwm'

# Reset of wireless
  alias nr='sudo systemctl restart netctl-auto@wlan0.service'
  # lists all modified files (for backing up)
  #alias pacman-mod='sudo pacman -Qii | awk \' /^MODIFIED/ {print $2}\' '
  # aliases that make games easier
  alias netctlstop='sudo systemctl stop netctl-auto@wlan0.service'
# for Ino (Arduino)
  alias inobus='ino build && ino upload && ino serial'
  alias inobu='ino build && ino upload'
  alias inob='ino build'
# for Android
  alias mntmtp='mkdir /home/patrick/mtp && jmtpfs /home/patrick/mtp'
  alias umntmtp='fusermount -u /home/patrick/mtp && rmdir /home/patrick/mtp'

# aliases for ECEN stuff
# alias quartus64='/home/patrick/altera/13.0sp1/quartus/bin/quartus --64bit'
# alias altera-monitor='/home/patrick/altera/13.0sp1/University_Program/Monitor_Program/bin/altera-monitor-program'
# alias modelsim='/home/patrick/altera/13.0sp1/modelsim_ase/bin/vsim'
  alias ltspice='wine ~/.wine/drive_c/Program\ Files/LTC/LTSpiceIV/scad3.exe'
# alias 4nec2='wine ~/.wine/drive_c/4nec2/exe/4nec2.exe'
  alias falstad='java -jar ~/build/falstad/circuit.jar'
# for MATLAB
# alias matp='/usr/local/MATLAB/R2014b/bin/matlab -nosplash -nodisplay -nodesktop'
  alias matlab='/usr/local/MATLAB/R2014b/bin/matlab'
# for Mathematica in Command Line
  alias mathmp='/opt/Wolfram/Mathematica/9.0/Executables/MathKernel'
# for nios2-gcc
  alias nios2-gcc='/home/patrick/altera/13.0sp1/nios2eds/bin/gnu/H-i686-pc-linux-gnu/bin/nios2-elf-gcc'
# Other useful things
# Show size of items
  alias lsd='du -d 1 -h . | sort -n'
# Toggle vpn and mac spoofing
# alias cloak='sudo ~/scripts/cloak.sh'
# alias decloak='sudo ~/scripts/decloak.sh'
# alias recloak='sudo ~/scripts/recloak.sh'
  alias pia='sudo systemctl start pia@Sweden'
  alias repia='sudo systemctl restart pia@Sweden'
  alias stopia='sudo systemctl stop pia@Sweden'
  alias ipwhere='geoiplookup $(curl http://ipecho.net/plain 2>/dev/null)'

# Microsoft Office Stuff
  alias word='exec wine ~/.wine/drive_c/Program\ Files/Microsoft\ Office/Office14/WINWORD.EXE'
  alias outlook='exec wine ~/.wine/drive_c/Program\ Files/Microsoft\ Office/Office14/OUTLOOK.EXE'
  alias excel='exec wine ~/.wine/drive_c/Program\ Files/Microsoft\Office/Office14/EXCEL.EXE'
  alias cuvpn='sudo openconnect -u paha5124 vpn.colorado.edu'

# Use feh to preview images
fp(){
  feh -g 640x480 -d -S $@ $pwd >&1
}

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

# Made on the internet
# export PS1="\u@\h \w\W >>\[$(tput sgr0)\]"

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

#Any to Base-Six
a2s(){
  echo "ibase=6; $@"|bc
}

# Helper function to list directories
treels(){
  tree -L $@ 
}

export EDITOR="vim"

# remove all previous duplicates in command history before saving the current one
export HISTCONTROL="erasedups"
export HISTFILESIZE=2500

export LS_COLORS="di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:*.deb=90"

#export PATH="~/bin:$PATH"
#export PATH="~/bin:~/scripts:/opt/altera/13.0sp1/quartus/bin:$PATH"
export PATH="~/bin:~/scripts:~/games/KSP_Linux:/opt/altera/13.0sp1/quartus/bin:/opt/Wolfram/Mathematica/9.0/Executables:$PATH"
eval $(dircolors -b $HOME/.dircolors)

PATH="/home/patrick/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="/home/patrick/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/patrick/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/patrick/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/patrick/perl5"; export PERL_MM_OPT;

export QSYS_ROOTDIR="/home/amber/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/20.1/quartus/sopc_builder/bin"

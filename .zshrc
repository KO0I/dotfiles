# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#setopt appendhistory extendedglob
setopt ksharrays nobeep autocd pushdsilent autopushd extendedglob autolist automenu listtypes inc_append_history share_history
unsetopt beep nomatch notify 
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'

autoload -Uz compinit colors 
#autoload -Uz colors 
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
colors
compinit
# End of lines added by compinstall

# key bindings
#bindkey 'e[1~' beginning-of-line
#bindkey '\e[4~' end-of-line
#bindkey '\e[5~' beginning-of-history
#bindkey '\e[6~' end-of-history
#bindkey '\e[3~' delete-char
#bindkey '\e[2~' quoted-insert
#bindkey '\e[5C' forward-word
#bindkey '\eOc' emacs-forward-word
#bindkey '\e[5D' backward-word
#bindkey '\eOd' emacs-backward-word
 bindkey "^[[H" beginning-of-line   # Home key
 bindkey "^[[F" end-of-line         # End key
 bindkey "^[[3~" delete-char        # Del key
# bindkey "^[[3;5~" delete-word      # Ctrl+Del
# bindkey "^?" backward-kill-word    # Ctrl+BackSpace
 bindkey "^[[1;5C" forward-word     # Ctrl+ ->
 bindkey "^[[1;5D" backward-word    # Ctrl+ <-

# Home and End keys
#   for rxvt:
# bindkey "\e[8~" end-of-line
# bindkey "\e[7~" beginning-of-line#

#   for other?
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

hash -d dwmdir="/home/$USER/build/dwm-6.0/src"
hash -d surfdir="/home/$USER/build/surf-git/src"
hash -d websitedir="/home/$USER/proj/chipchirp/KO0I.github.io"

# Development
hash -d blackice_examples="/home/$USER/build/BlackIce-II/examples"

# Aliases
# TODO a nag for now --------
alias pacaur='man yay'
# ---------------------------
alias ff='firefox'
alias vim='vim -p'
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias vzh='vim ~/.zsh_history'
alias dwm='exec ~dwmdir/dwm'
alias ls='ls --color=auto'
alias ll='ls -l'
alias lll='ls -last'
alias alsamixer='alsamixer -c 1'
alias tr2='tree -L 2'
alias lh='ls -d .* --color=auto'
alias mirror='sudo ~/scripts/reflect.sh'
alias ssh_hilbert='ssh patrick@hilbert -P 29307'
alias ssh_jussieu='ssh patrick@jussieu -P 29308'
alias wine64='WINEARCH=win64 WINEPREFIX=~/win64 wine'
alias tos=./thinkorswim/thinkorswim
#alias pacinstalled='pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }''

alias vivado='/opt/Xilinx/Vivado/2019.2/bin/vivado_hls'

#5224 School stuff
alias ads='/usr/local/ADS2019/bin/ads'
alias rdpconway='rdesktop -g 1440x900 -P -z -x l -u Patrick everybodydoesthe.dyn-o-saur.com:3389'
alias mntconway='mount.cifs //192.168.11.10/Shared conway_Shared -o user=Patrick'
alias umntconway='umount -l conway_Shared'
alias ltspice='WINEARCH=win64 WINEPREFIX=~/win64 wine ~/win64/drive_c/Program\ Files/LTC/LTspiceXVII/XVIIx64.exe'
alias si9000='WINEARCH=win64 WINEPREFIX=~/win64 wine ~/win64/drive_c/Program\ Files\ \(x86\)/Polar/Si9000/Si9000FieldSolver.exe'
alias hyperlynx='WINEARCH=win64 WINEPREFIX=~/win64 wine ~/win64/drive_c/MentorGraphics/9.4.1HL/SDD_HOME/hyperlynx64/bsw.exe'

#5813 School stuff
alias 5813_git='/home/patrick/school/5813_PES/projects'
alias mcuworkspace='/home/patrick/Documents/MCUXpresso*/workspace'
alias mcuxpresso='/usr/local/mcuxpresso-ide/ide/mcuxpressoide'

alias mcuxpresso='/usr/local/mcuxpresso-ide/ide/mcuxpressoide'


# For Android
#alias mntmtp='if [ -d mtp ]; then fusermount -u /home/$USER/mtp; rmdir mtp; else mkdir /home/$USER/mtp; fi && jmtpfs /home/$USER/mtp'
#alias umntmtp='fusermount -u /home/$USER/mtp && rmdir /home/$USER/mtp'

# ifuse to mount iPhone
alias mntiphone='ifuse /media/iPhone -o allow_other'
alias umntiphone='fusermount -u /media/iPhone'

# Requires geoiplookup
alias ipwhere='geoiplookup $(curl http://ipecho.net/plain 2>/dev/null)'

# ind study
alias xfdtd='/usr/local/remcom/XFdtd_7.8.1.4/bin/Linux-x86_64UBNT18/xfdtd'


# Requires google-translate package
alias e2d='google-translate en de $@'
alias d2e='google-translate de en $@'

#alias mathematica='/home/$USER/bin/mathematica'
#alias mathematica='/home/$USER/bin/Wolfram/Mathematica/10.4/mathematica'
# Simple Prompt
#PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}>> %{$reset_color%}"
#PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}>> %{$reset_color%}"
export PS1=$'%{\e[0;44m%}[%{\e[0;36m%} %n%{\e[0;37m%}@%{\e[0;31m%}%m%{\e[0m%}: %{\e[1;34m%}%~ %{\e[0;44m%}]%{\e[0m%}\n%{\e[0;37m%}%h %{\e[0;32m%}$%{\e[0m%} '

# Bind Keys
bindkey "^[[A" up-line-or-beginning-search    #Up
bindkey "^[[B" down-line-or-beginning-search  #Down

# For fun:
steam='LIBGL_DRI3_DISABLE=1 steam'
wine64steam='WINEARCH=win64 WINEPREFIX=~/win64 wine steam'

# Helper Functions
# Rename an xterm window
xtname(){
  echo "\033]0;$@\007"
}

# 'alias' cd and ls together
function chpwd(){
	emulate -L zsh
	ls
}

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

h2b64(){
  echo "obase=64; ibase=16; $@"|bc
}

greprl(){
  grep -Rls $@ *
}

grepr(){
  grep -R $@ *
}

#Change color temp of screen using redshift
redshift-to(){
  redshift -x
  sleep 0.5
  redshift -O $@
}

# Helper to set brightness as a matter of percentage
brightness-pct(){
  bright_arg=`bc -l <<< ($@*8.52)`
  tee /sys/class/backlight/intel_backlight/brightness <<< bright_arg
}

# Helper function to list directories
treels(){
  tree -L $@ | less
}

xprop_peek(){
  xprop |awk '
  /^WM_CLASS/{sub(/.* =/, "instance:"); sub(/,/, "\nclass:"); print}
  /^WM_NAME/{sub(/.* =/, "title:"); print}'
}

export EDITOR="vim"
export WINEPREFIX=$HOME/wine32/
export WINEARCH=win32

export PATH="/home/$USER/bin:/home/$USER/scripts:$PATH"
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"

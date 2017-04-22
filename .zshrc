# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
#setopt appendhistory extendedglob
setopt ksharrays nobeep autocd pushdsilent autopushd extendedglob autolist automenu listtypes inc_append_history share_history
unsetopt autocd beep nomatch notify 
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

hash -d dwmdir="/home/patrick/build/dwm-6.0/src/dwm-6.0"

# Aliases
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias vzh='vim ~/.zsh_history'
alias ls='ls --color=auto'
alias ll='ls -l'
alias lll='ls -last'
alias lh='ls -d .* --color=auto'
alias mirror='sudo ~/scripts/reflect.sh'
#alias pacinstalled='pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }''

alias mntmtp='if [ -d mtp ]; then; else mkdir /home/patrick/mtp; fi && jmtpfs /home/patrick/mtp'
alias umntmtp='fusermount -u /home/patrick/mtp && rmdir /home/patrick/mtp'

# Requires geoiplookup
alias ipwhere='geoiplookup $(curl http://ipecho.net/plain 2>/dev/null)'


# Requires google-translate package
alias e2d='google-translate en de $@'
alias d2e='google-translate de en $@'

#alias mathematica='/home/$USER/bin/mathematica'
alias mathematica='/home/patrick/bin/Wolfram/Mathematica/10.4/mathematica'
# Simple Prompt
#PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}>> %{$reset_color%}"
#PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}>> %{$reset_color%}"
export PS1=$'%{\e[0;44m%}[%{\e[0;36m%} %n%{\e[0;37m%}@%{\e[0;31m%}%m%{\e[0m%}: %{\e[1;34m%}%~ %{\e[0;44m%}]%{\e[0m%}\n%{\e[0;37m%}%h %{\e[0;32m%}$%{\e[0m%} '

# Bind Keys
bindkey "^[[A" up-line-or-beginning-search    #Up
bindkey "^[[B" down-line-or-beginning-search  #Down

# For fun:
steam='LIBGL_DRI3_DISABLE=1 steam'

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

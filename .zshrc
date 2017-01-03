# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
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
 bindkey "\e[1~" beginning-of-line
 bindkey "\e[4~" end-of-line
 bindkey "\e[5~" beginning-of-history
 bindkey "\e[6~" end-of-history
 bindkey "\e[3~" delete-char
 bindkey "\e[2~" quoted-insert
 bindkey "\e[5C" forward-word
 bindkey "\eOc" emacs-forward-word
 bindkey "\e[5D" backward-word
 bindkey "\eOd" emacs-backward-word
# bindkey "\e[C" forward-word
# bindkey "\e[D" backward-word
 bindkey "^H" backward-delete-word
# # for rxvt
 bindkey "e[8~" end-of-line
 bindkey "e[7~" beginning-of-line#
#bindkey "${terminfo[khome]}" beginning-of-line
#bindkey "${terminfo[kend]}" end-of-line
# Home and End keys

# Aliases
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -l'
alias lll='ls -last'
alias lh='ls -d .* --color=auto'
alias mirror='sudo ~/scripts/reflect.sh'
#alias pacinstalled='pacman -Qei | awk '/^Name/ { name=$3 } /^Groups/ { if ( $3 != "base" && $3 != "base-devel" ) { print name } }''

# Requires geoiplookup
alias ipwhere='geoiplookup $(curl http://ipecho.net/plain 2>/dev/null)'


# Requires google-translate package
alias e2d='google-translate en de $@'
alias d2e='google-translate de en $@'

alias mathematica='/home/$USER/bin/mathematica'
# Simple Prompt
#PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}>> %{$reset_color%}"
glyph=$(awk 'BEGIN { print "\302\273"; }')
PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}$glyph %{$reset_color%}"

# Bind Keys
bindkey "^[[A" up-line-or-beginning-search    #Up
bindkey "^[[B" down-line-or-beginning-search  #Down

# For fun:
steam='LIBGL_DRI3_DISABLE=1 steam'

# Helper Functions
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

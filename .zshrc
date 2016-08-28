# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
unsetopt autocd beep nomatch notify 
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/patrick/.zshrc'

#autoload -Uz compinit colors 
autoload -Uz colors 
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
colors
# End of lines added by compinstall

# Aliases
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias ls='ls --color=auto'
alias ll='ls -last'
alias lh='ls -d .* --color=auto'

# Requires google-translate package
alias e2d='google-translate en de $@'
alias d2e='google-translate de en $@'

# Simple Prompt
PS1="%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_bold[blue]%}%1~%{$reset_color%} %{$fg[green]%}>> %{$reset_color%}"

# Bind Keys
bindkey "^[[A" up-line-or-beginning-search    #Up
bindkey "^[[B" down-line-or-beginning-search  #Down

# Little Helper Functions
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
  tree -L $@ 
}

export EDITOR="vim"

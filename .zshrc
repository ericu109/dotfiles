# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/eric/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias vim='nvim'
alias ...='cd ../..'
alias ....='cd ../../..'

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

# powerline-shell stuff
function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi
# end powerline-shell stuff

# key bindings, you can find keybind by running cat and typing what you want, then copying the codes output by cat
bindkey '^R' history-incremental-search-backward
bindkey '^\b' backward-kill-word
bindkey '^[[1;5D' vi-backward-word
bindkey '^[[1;5C' vi-forward-word
bindkey '^[[3~' vi-delete-char
bindkey '^[[H' vi-digit-or-beginning-of-line
bindkey '^[[F' vi-end-of-line

# opt setting
setopt correct

# additional paths
export PATH="$PATH:$HOME/.dotnet/tools/"
export LIBVIRT_DEFAULT_URI="qemu:///system"
export EDITOR="nvim"

neofetch

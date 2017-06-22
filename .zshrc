export PATH=/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/4.7.3:/usr/games/bin:~/apps/bin:~/.local/bin
autoload colors
colors
PS1="[$(print '%{\e[38;5;208;1m%}%n%{\e[0m%}')%{$fg[white]%}@%{$reset_color%}%{$fg_bold[white]%}%M%{$reset_color%} $(print '%{\e[38;5;202m%}%~%{\e[0m%}') ] "

#options
lsopt='--color=auto'
KEYTIMEOUT=1
export EDITOR='vim'
export TERM=xterm-256color
export GPG_TTY=$(tty)

#correct mistakes
setopt correct_all

#ignore duplicate entries in history
setopt hist_ignore_all_dups

#write history after entering it
setopt inc_append_history
export HISTFILE=~/.zsh_history
export SAVEHIST=4000

#history output, using up/down keys
export HISTSIZE=4000
autoload -Uz compinit
compinit
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
bindkey '^R' history-incremental-search-backward
bindkey '^_' undo
bindkey '^K' kill-line
bindkey "^U" backward-kill-line
bindkey "^[OH" beginning-of-line
bindkey "^[[H" beginning-of-line
bindkey "e[1~" beginning-of-line
bindkey "^[OF" end-of-line
bindkey "^[[F" end-of-line
bindkey "e[4~" end-of-line
bindkey "^[[5~" beginning-of-buffer-or-history
bindkey "^[[6~" end-of-buffer-or-history
bindkey "^[[3~" delete-char

#colorized man
man() {
    LESS_TERMCAP_md=$'\e[01;34m' \
    LESS_TERMCAP_me=$'\e[01;33m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[01;37m' \
    LESS_TERMCAP_us=$'\e[01;92m' \
    command man "$@"
}

#load aliases
alias_files=('.aliases' '.alias_functions' '.alias_dockerized' '.alias_env')
for alias in ${alias_files}; do
  if [ -f ${alias} ]; then
    source ${alias}
  fi
done

#ls colors
if [ -f ~/.dircolors ]
  then eval $(dircolors ~/.dircolors)
fi

#vi-mode indication
function zle-line-init zle-keymap-select {
  if [ -z $_PS1 ]; then
    _PS1=$PS1
  fi
  case $KEYMAP in
    vicmd) PS1='[%F{cyan}vi%f]'${PS1};;
    viins|main) PS1=${_PS1};;
  esac
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

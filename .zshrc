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
#
#fixes for special keys
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

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
alias_files=('.aliases' '.alias_functions' '.alias_dockerized') 
for alias in ${alias_files}; do
  if [ -f ${alias} ]; then
    source ${alias}
  fi
done
#load colors for ls
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

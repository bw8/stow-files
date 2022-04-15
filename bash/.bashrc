#====================================================#
#  _               _               #                 #
# | |__   __ _ ___| |__  _ __ ___  # 2021-03-30      #
# | '_ \ / _` / __| '_ \| '__/ __| # v0.9.1          #
# | |_) | (_| \__ \ | | | | | (__  #                 #
# |_.__/ \__,_|___/_| |_|_|  \___| # bw8             #
#====================================================#
# Dependencies: starship

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# PROMPT PS1
#function nonzero_return() {
#	RETVAL=$?
#	[ $RETVAL -ne 0 ] && echo "$RETVAL "
#}
#C0="$(tput setaf 0)"
#C1="$(tput setaf 1)"
#C2="$(tput setaf 2)"
#C3="$(tput setaf 3)"
#C4="$(tput setaf 4)"
#C5="$(tput setaf 5)"
#C6="$(tput setaf 6)"
#C7="$(tput setaf 7)"
#C8="$(tput setaf 8)"
#C9="$(tput setaf 9)"
#C10="$(tput setaf 10)"
#C11="$(tput setaf 11)"
#C12="$(tput setaf 12)"
#C13="$(tput setaf 13)"
#C14="$(tput setaf 14)"
#C15="$(tput setaf 15)"
#RESET="$(tput sgr0)"
#BOLD="$(tput bold)"

#bashprompt="${BOLD}${C1}\`nonzero_return\`${C1}[${C6}\u${C2}@${C5}\h${C2}:${C4}\w${C1}]${C3}\\$ ${RESET}"

# Parrot PS1
#parrotprompt='${C1}┌─[${C6}\u${C3}@${C2}\h${C1}]─[${C4}\w${C1}]\n${C1}└─`nonzero_return`╼ ${C3}\$ ${RESET}'

#PS1="$bashprompt"

# Vi mode
set -o vi

# Case insensitive completion
bind 'set completion-ignore-case on'

# Key bindings
# check key bindings running 'bind -P'
bind -m vi-insert 'Control-l: clear-screen'
bind -m vi-insert 'Control-p: previous-history'
bind -m vi-insert 'Control-n: next-history'
bind -m vi-insert 'Control-f: edit-and-execute-command'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'
fi

# ALIASES
[[ -f ~/.config/aliases ]] && source ~/.config/aliases

# LS_COLORS
export LS_COLORS=":su=30;41:ow=30;42:st=30;44::su=30;41:ow=30;42:st=30;44::su=30;41:ow=30;42:st=30;44::su=30;41:ow=30;42:st=30;44:"

# STARSHIP PROMPT
eval "$(starship init bash)"

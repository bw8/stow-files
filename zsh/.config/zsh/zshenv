# Add this lines to "/etc/zsh/zshenv" 
# export ZDOTDIR="$HOME/.config/zsh"
# export HISTFILE="$ZDOTDIR/.zsh_history"
#
#ZDOTDIR="${${(%):-%x}:P:h}"
#        ${            :h}   Remove trailing pathname component (man zshexpn)
#        #        ${          :P  }   Get realpath (man zshexpn)
#        #          ${(%):-  }        Enable prompt expansion (man zshexpn zshmisc)
#        #          ${     %x}        Name of file containing this line (man zshmisc)
source $ZDOTDIR/aliases

# export XDG_CONFIG_HOME
#export ZDOTDIR="/home/bw8/.config/zsh"
export ZDIR="$ZDOTDIR"
export ZENV="$ZDOTDIR/.zshenv"
export HISTFILE="$ZDOTDIR/.zsh_history"

export CONFIG_DIR="$HOME/.config"
export GNUPGHOME="$CONFIG_DIR/gnupg"
export PASSWORD_STORE_DIR="$HOME/.local/share/passwds"

export PATH=$PATH:"/home/bw8/.scripts"
export PATH=$PATH:"/home/bw8/bin"
export PATH="${PATH}:${HOME}/.local/bin"
export PATH="${PATH}:${HOME}/.config/polybar/scripts"


#export LC_TIME=es_ES

export BROWSER='firefox'
export EDITOR='vim'

export VIM_LATEX_FOLDER="$HOME/docs/latex"
export VIM_LATEX_TEMPLATE_DIR="$VIM_LATEX_FOLDER/templates"
export VIM_LATEX_OUTPUT="/tmp"
export VIM_LATEX_DOC="output"

# Set vim to default pager in man-pages
#export PAGER='env MAN_PN=1 vim -M +MANPAGER -'
# export MANPAGER='vim -M +MANPAGER -'
# export MANPAGER="vim -M +MANPAGER -c 'set ft=man ts=8 nomod nolist nonu noma' -"
export MANPAGER='vim -c "%! col -b" -c MANPAGER -c "set ft=man ts=8 nomod nolist nonu nornu noma " - '

# set
# ft=man filetype is man file
# ts=8 replace tabs with eight spaces
# nomod prevent modification
# nolist list disables har line breaks in older vim versions
# nonu no line numbers
# nornu no line relative numbers
# noma buffer cannot be modified
# linebreak wrap lines at word boundaries
# breakindent visually indent wrapped lines
# wrap soft wrap (visually wrap but don't enter a newline) lines



#fix for nmcli (ANSI escape sequences colors) 
export PAGER='less'

if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
	 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

if [ -d "$HOME/home/bw8/.cargo/bin" ] ; then
	export PATH=$PATH:"/home/bw8/.cargo/bin"
fi

# export MYVIMRC
export VIMINIT='source $MYVIMRC'
export MYVIMRC='/home/bw8/.config/vim/vimrc'
set viminfo+=n/home/bw8/.config/vim/viminfo

# export RANGER
export RANGER_LOAD_DEFAULT_RC=false
#export RANGER_LOAD_DEFAULT_RC="$HOME/.config/ranger/rc.conf"

# Env variable colors from Xresources
source "/home/bw8/.config/colors/colors.sh"
# export pywal var colors
#source "${HOME}/.cache/wal/colors.sh"

# BW
# export BW_CLIENTID="$(gpg -q --for-your-eyes-only --no-tty -d $PASSWORD_STORE_DIR/bw/id.gpg)"
# export BW_CLIENTSECRET="$(gpg -q --for-your-eyes-only --no-tty -d $PASSWORD_STORE_DIR/bw/secret.gpg)"

# WINE
#export WINEPREFIX="/home/bw8/.config/wine"

# TTRV
#export MAILCAPS="/home/bw8/.config/ttrv/mailcap"
#export TTRV_URLVIEWER="urlscan"

# DOTFILES
export DOTFILES_DIR="/home/bw8/dotfiles"

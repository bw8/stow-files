#          _
#  _______| |__   ___ _ ____   __
# |_  / __| '_ \ / _ \ '_ \ \ / /
#  / /\__ \ | | |  __/ | | \ V /
# /___|___/_| |_|\___|_| |_|\_/
#
#
#
# To change default location of zsh files
# Add this lines to "/etc/zsh/zshenv"
# export ZDOTDIR="$HOME/.config/zsh"
#
#ZDOTDIR="${${(%):-%x}:P:h}"
#        ${            :h}   Remove trailing pathname component (man zshexpn)
#        #        ${          :P  }   Get realpath (man zshexpn)
#        #          ${(%):-  }        Enable prompt expansion (man zshexpn zshmisc)
#        #          ${     %x}        Name of file containing this line (man zshmisc)


export CONFIG_DIR="$HOME/.config"
export GNUPGHOME="$CONFIG_DIR/gnupg"
export PASSWORD_STORE_DIR="$HOME/.local/share/passwds"


# ==================== PATH ====================

# ~/bin
if [ -d "$HOME/bin" ] ; then
	export PATH="${PATH}:${HOME}/bin"
fi

# ~/.local/bin
if [ -d "$HOME/.local/bin" ] ; then
	export PATH="${PATH}:${HOME}/.local/bin"
fi

# Cargo ~/.cargo/bin
if [ -d "$HOME/.cargo/bin" ] ; then
	export PATH=$PATH:"/home/bw8/.cargo/bin"
fi

# ==================== DEFAULT PROGRAMS ====================
export BROWSER='firefox'
export VISUAL='nvim'
export EDITOR='nvim'
export TERMINAL='alacritty'

# PAGER / MANPAGER
bat -V 1>/dev/null && export PAGER='bat'
nvim -v 1>/dev/null && export MANPAGER="nvim -c 'Man!' -"

# Env variable colors from Xresources
source "/home/bw8/.config/colors/colors.sh"

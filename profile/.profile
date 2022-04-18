# Autostart X at login
# EXPORTS
export ZDOTDIR="$HOME/.config/zsh"

# BASH
if [ -n "$BASH_VERSION" ]; then
    [[ -f ~/.bashrc ]] && source ~/.bashrc
fi

# ZSH
if [ -n "$ZSH_VERSION" ]; then
    [[ -f $ZDOTDIR/.zshrc ]] && source $ZDOTDIR/.zshrc
fi

# Maybe include in PATH $HOME/bin and $HOME/.local/bin ?
# Currently PATH setted in .zshenv

# Auto start x when login tty1 and there is display.
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -le 1 ]; then
  exec startx
fi

#========================================#
#          _               #             #
#  _______| |__  _ __ ___  # 2021-04-15  #
# |_  / __| '_ \| '__/ __| # v0.9.5      #
#  / /\__ \ | | | | | (__  #             #
# /___|___/_| |_|_|  \___| # bw8         #
#========================================#
# Dependencies:
#   Prompt: * starship    (install 'curl -sS https://starship.rs/install.sh | sh')
#   Plugins: * zsh-autosuggestions
#            * zsh-completions
#            * zsh-syntax-highlighting
#            * zsh-vi-mode
# All plugins will be auto installed in $ZDOTDIR/plugins if they aren't found
# in /usr/share/zsh/plugins or $ZDOTDIR/plugins

# Enable color syntax.
autoload -U colors && colors

# Allow comments in interactive shells.
setopt interactive_comments


# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history


# Tab completion
autoload -U compinit    # Initialize the completion
zstyle ':completion:*' menu select # Enable navigation in completion menu
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' # Case-insesitive completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Display colors
zmodload zsh/complist
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION # Zcompdump in cache directory
_comp_options+=(globdots) # Include hidden files

# Completion in cache directory:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/completion

# Helper function to avoid complete (zsh-lovers)
xdvi() { command xdvi ${*:-*.dvi(om[1])} }
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

# Completing process IDs
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always


# FUNCTIONS
source "$ZDOTDIR/zsh-functions"

# PLUGINS
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-completions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "jeffreytse/zsh-vi-mode"


# ALIASES
[[ -f ~/.config/aliases ]] && source $(dirname $ZDOTDIR)/aliases
# KEYBINDS
#[[ -f ~/.config/keybinds ]] && source ~/.config/keybinds


# Load completions from zsh-completions
fpath=(/usr/share/zsh/site-functions $fpath)

# Load completions from $ZDOTDIR/completions
fpath=($ZDOTDIR/completion $fpath)

# Load zsh-autosuggestions
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#export zautosuggestions=${zautosuggestions:=$(find /usr/share/ -name zsh-autosuggestions.zsh || return 0)}
#source $zautosuggestions

# Load zsh-vi-mode
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Load zsh-syntax-highlighting: should be last.
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# STARSHIP PROMPT
eval "$(starship init zsh)"

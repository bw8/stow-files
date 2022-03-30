#============================================#
#          _               #                 #
#  _______| |__  _ __ ___  # 2021-03-30      #
# |_  / __| '_ \| '__/ __| # v0.9.1          #
#  / /\__ \ | | | | | (__  #                 #
# /___|___/_| |_|_|  \___| # bw8             #
#============================================#
# Dependencies: starship

# Enable colors and change prompt
autoload -U colors && colors

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
_comp_options+=(globdots) # Include .files in completion

# Completion in cache directory:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/completion

#
xdvi() { command xdvi ${*:-*.dvi(om[1])} }
zstyle ':completion:*:*:xdvi:*' menu yes select
zstyle ':completion:*:*:xdvi:*' file-sort time

# Completing process IDs
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always


# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# Use ranger to switch directories and bind it to ctrl-f
rcd () {
	tmp="$(mktemp)"
	ranger --choosedir="$tmp" "$@"
	if [ -f "$tmp" ]; then
		dir="$(cat "$tmp")"
		rm -f "$tmp"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}
bindkey -s '^f' 'rcd\n'

# Edit command in vim  with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# ALIASES
[[ -f ~/.config/aliases ]] && source ~/.config/aliases

# Load zsh-syntax-highlighting: should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# STARSHIP PROMPT
eval "$(starship init zsh)"

#============================================#
#          _               #                 #
#  _______| |__  _ __ ___  # 2021-03-30      #
# |_  / __| '_ \| '__/ __| # v0.9.1          #
#  / /\__ \ | | | | | (__  #                 #
# /___|___/_| |_|_|  \___| # bw8             #
#============================================#
# Dependencies: starship

# Enable color syntax
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
_comp_options+=(globdots) # Include hidden files

# Completion in cache directory:
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/completion

# I'm not sure what this do
#xdvi() { command xdvi ${*:-*.dvi(om[1])} }
#zstyle ':completion:*:*:xdvi:*' menu yes select
#zstyle ':completion:*:*:xdvi:*' file-sort time

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

# Edit command in vim  with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line


# FUNCTIONS
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

# UGR function
fugr () {
    tmux rename-session UGR
    selected=`printf "AC\nALG\nFBD" | fzf`
    tmux rename-window $selected
    cd ~/UGR/$selected
}



# ALIASES
[[ -f ~/.config/aliases ]] && source ~/.config/aliases
# KEYBINDS
[[ -f ~/.config/keybinds ]] && source ~/.config/keybinds


# Load completions from zsh-completions
fpath=(/usr/share/zsh/site-functions $fpath)

# Load zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#export zautosuggestions=${zautosuggestions:=$(find /usr/share/ -name zsh-autosuggestions.zsh || return 0)}
#source $zautosuggestions

# Load zsh-vi-mode
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Load zsh-syntax-highlighting: should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null


# STARSHIP PROMPT
eval "$(starship init zsh)"

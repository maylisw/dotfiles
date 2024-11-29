# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# use vi mode in zsh
# TODO: setup p10k to show mode in prompt?
set -o vi # bindkey -v = viins, bindkey -a = vicmd
export KEYTIMEOUT=1

# use vim keys in tab completion menu
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
# make backspace work
bindkey '^?' backward-delete-char

# edit commands in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# To customize prompt, run `p10k configure`
# Use a host-specific prompt
[[ ! -f ~/.util/p10k.zsh ]] || source ~/.util/p10k.zsh

# host-specific setup
source $HOME/.util/host.zsh

# editor
export EDITOR=nvim

# shell setup
source ~/.zsh_aliases
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# auto-suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept
bindkey '^y' autosuggest-execute
bindkey '^n' autosuggest-fetch
bindkey '^d' autosuggest-clear
bindkey '^o' autosuggest-toggle

# fzf
source <(fzf --zsh)

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

HOMEBREW_AUTO_UPDATE_SECS=604800 # update once a week

# should go last
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you use oh-my-zsh, add it after source $ZSH/oh-my-zsh.sh
if [[ -f ~/.stripe/shellinit/zshrc ]]; then
  source ~/.stripe/shellinit/zshrc
fi

# editor
export EDITOR=nvim
set -o vi

source <(fzf --zsh)

source ~/.zsh_aliases
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

bindkey "^h" backward-word
bindkey "^l" forward-word
bindkey "^H" backward-kill-word

# use vim bindings for accepting suggestions
bindkey '^ ' autosuggest-accept
bindkey '^y' autosuggest-execute
bindkey '^n' autosuggest-fetch
bindkey '^d' autosuggest-clear
bindkey '^o' autosuggest-toggle

getBranch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}

# %* = current time in hh:mm:ss
# CWD=%~ (%c for just last)
# ${vcs_info_msg_0_} = git branch
# %F{color} = make text this color
# %f = revert to regular text
# %n = username
setopt prompt_subst
PS1='%B%F{green}%n%F{magenta}@%m%f%b %F{yellow}%*%f %F{blue}%c%f $(getBranch "[%s]")$ '
# eval "$(starship init zsh)"

HOMEBREW_AUTO_UPDATE_SECS=604800 # update once a week

# START - Managed by chef cookbook stripe_cpe_bin
alias tc='/usr/local/stripe/bin/test_cookbook'
alias cz='/usr/local/stripe/bin/chef-zero'
alias cookit='tc && cz'
# STOP - Managed by chef cookbook stripe_cpe_bin

# should go last
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If you use oh-my-zsh, add it after source $ZSH/oh-my-zsh.sh
if [[ -f ~/.stripe/shellinit/zshrc ]]; then
  source ~/.stripe/shellinit/zshrc
fi

# editor
export EDITOR=nvim
set -o vi

source ~/.zsh_aliases
# eval "$(starship init zsh)"

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

HOMEBREW_AUTO_UPDATE_SECS=3600 # update once an hour

# START - Managed by chef cookbook stripe_cpe_bin
alias tc='/usr/local/stripe/bin/test_cookbook'
alias cz='/usr/local/stripe/bin/chef-zero'
alias cookit='tc && cz'
# STOP - Managed by chef cookbook stripe_cpe_bin

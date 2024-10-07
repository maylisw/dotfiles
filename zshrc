# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# editor
export EDITOR=nvim
set -o vi

source <(fzf --zsh)

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

source ~/.zsh_aliases
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
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


# %* = current time in hh:mm:ss
# CWD=%~ (%c for just last)
# ${vcs_info_msg_0_} = git branch
# %F{color} = make text this color
# %f = revert to regular text
# %n = username
getBranch() {
    git rev-parse --abbrev-ref HEAD 2> /dev/null
}
setopt prompt_subst
PS1='%B%F{green}%n%F{magenta}@%m%f%b %F{yellow}%*%f %F{blue}%c%f $(getBranch "[%s]")$ '

HOMEBREW_AUTO_UPDATE_SECS=604800 # update once a week

# should go last
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

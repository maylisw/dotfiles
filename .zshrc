# editor
export EDITOR=vim
set -o vi

source .zsh_aliases
source git-prompt.sh

# git tab completion
autoload -Uz compinit && compinit

# git prompt config settings
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWCOLORHINTS=1

GIT_PS1_SHOWUPSTREAM="auto"
# GIT_PS1_SHOWUNTRACKEDFILES=1

GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_DESCRIBE_STYLE="branch"

# %* = current time in hh:mm:ss
# CWD=%~ (%c for just last)
# ${vcs_info_msg_0_} = git branch
# %F{color} = make text this color
# %f = revert to regular text
# %n = username
setopt prompt_subst
PS1='%B%F{magenta}%n%f%b %F{yellow}%*%f %F{blue}%c%f $(__git_ps1 "[%s]")$ '

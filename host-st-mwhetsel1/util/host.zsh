# stripe laptop shell configurations
export HOST_TYPE="work"

# If you use oh-my-zsh, add it after source $ZSH/oh-my-zsh.sh
if [[ -f ~/.stripe/shellinit/zshrc ]]; then
  source ~/.stripe/shellinit/zshrc
fi

alias prn="pay remote new --repo stripe-internal/gocode:master --ide none --no-notify-on-ready"

source ~/.util/stripe.zsh

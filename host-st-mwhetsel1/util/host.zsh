# stripe laptop shell configurations

# If you use oh-my-zsh, add it after source $ZSH/oh-my-zsh.sh
if [[ -f ~/.stripe/shellinit/zshrc ]]; then
  source ~/.stripe/shellinit/zshrc
fi

alias prn="pay remote new --repo stripe-internal/gocode:master --ide none --no-notify-on-ready"

export GH_HOST=git.corp.stripe.com
export SRC_ACCESS_TOKEN=sgp_foobar
export SRC_ENDPOINT="http://sourcegraph.corp.stripe.com"
export SRC_PROXY="unix://~/.stripeproxy"

source ~/.util/stripe.zsh

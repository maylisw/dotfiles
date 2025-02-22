# stripe laptop shell configurations
export HOST_TYPE="work"

# If you use oh-my-zsh, add it after source $ZSH/oh-my-zsh.sh
if [[ -f ~/.stripe/shellinit/zshrc ]]; then
  source ~/.stripe/shellinit/zshrc
fi

alias prn="pay remote new --repo stripe-internal/gocode:master --ide none --no-notify-on-ready"

export GH_HOST=git.corp.stripe.com

ssh-add --apple-use-keychain ~/.ssh/id_rsa_mwhetsel@stripe.com

source ~/.util/stripe.zsh

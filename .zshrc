autoload -Uz compinit
compinit


if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# hist log date format: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    git
    bundler
    dotenv
    rake
    rbenv
    ansible
    aws
    # docker-compose
    gitfast
    terraform
    vscode
    git-extras
    # docker
    zsh-syntax-highlighting
    zsh-autosuggestions
    bgnotify
)

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Install Golang
export PATH=$PATH:/usr/local/go/bin

# Snap apps path
export PATH="$PATH:/snap/bin"

# Rancher Desktop Path (local K8S)
export PATH="$PATH:$HOME/.rd/bin"

# Local bin
export PATH="$PATH:$HOME/.local/bin"

# Setup alias and exports:
export MANPAGER="/usr/bin/most -s"


# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus


# source <(kubectl completion zsh)
# alias k=kubectl
# complete -F __start_kubectl k

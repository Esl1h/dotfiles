# Early return — evita overhead em sub-processos do Cursor/VSCode/Electron
if [[ "$VSCODE_RESOLVING_ENVIRONMENT" == "1" ]] || [[ "$ELECTRON_RUN_AS_NODE" == "1" ]]; then
  return
fi

# ─── p10k instant prompt (DEVE vir antes de qualquer output) ─────────────────
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ─── Oh My Zsh ───────────────────────────────────────────────────────────────
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
  git
  gitfast
  git-extras
  bundler
  dotenv
  rake
  rbenv
  aws
  ansible
  terraform
  docker
  kubectl
  vscode
  bgnotify
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# ─── fpath / funções locais ──────────────────────────────────────────────────
fpath=(~/.zsh/completions ~/.zsh/functions $fpath)
autoload -Uz ~/.zsh/functions/*(N:t)

# ─── compinit (única vez, com cache de 24h) ──────────────────────────────────
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

autoload -Uz promptinit && promptinit
autoload -U +X bashcompinit && bashcompinit

# ─── PATH (typeset -U garante zero duplicatas) ──────────────────────────────
typeset -U path
path=(
  "$HOME/.local/bin"
  "$HOME/gems/bin"
  "$HOME/.rd/bin"
  /usr/local/go/bin
  /snap/bin
  $path
)
export PATH

# ─── Exports ─────────────────────────────────────────────────────────────────
export GEM_HOME="$HOME/gems"
export MANPAGER="/usr/bin/most -s"
export EDITOR=vim
export VISUAL=vim

# ─── Cargo (Rust) ────────────────────────────────────────────────────────────
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# ─── Atuin (shell history) ───────────────────────────────────────────────────
if [[ -f "$HOME/.atuin/bin/env" ]]; then
  source "$HOME/.atuin/bin/env"
  eval "$(atuin init zsh)"
fi

# ─── Terraform completion ────────────────────────────────────────────────────
complete -o nospace -C /usr/bin/terraform terraform

# ─── Aliases — git ───────────────────────────────────────────────────────────
alias g='git'
alias gs='git status -sb'
alias gl='git lg'
alias gd='git diff'
alias gds='git diff --staged'
alias gp='git pull --rebase'
alias gpo='git push -u origin HEAD'
alias gpf='git push --force-with-lease'

# ─── p10k (deve ser o último source) ────────────────────────────────────────
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

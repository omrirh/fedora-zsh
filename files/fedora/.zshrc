# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
ENABLE_CORRECTION="false"

# History: large, shared between sessions, no duplicates, skip lines starting with a space
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE SHARE_HISTORY

# zsh-completions must be on fpath before oh-my-zsh runs compinit
fpath+=(${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-completions/src)

# Order matters: fzf-tab before zsh-autosuggestions / zsh-syntax-highlighting,
# history-substring-search after zsh-syntax-highlighting.
plugins=(
  # git
  git
  git-extras
  gitignore
  # system
  sudo
  extract
  cp
  rsync
  dnf
  systemd
  podman
  tmux
  # python
  python
  pip
  uv
  # cloud / openshift
  oc
  kubectl
  aws
  gcloud
  azure
  # utils
  copypath
  copyfile
  jsontools
  encode64
  urltools
  colored-man-pages
  # navigation / completion
  fzf
  zoxide
  autoupdate
  fzf-tab
  you-should-use
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration
setopt EXTENDED_GLOB

# fzf-tab: fzf menu for every <Tab>, with previews for cd / files
zstyle ':completion:*' menu no
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':fzf-tab:*' switch-group '<' '>'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always --icons $realpath'
zstyle ':fzf-tab:complete:(nvim|vim|bat|cat|less):*' fzf-preview 'bat --color=always --style=numbers --line-range=:200 $realpath 2>/dev/null || eza -1 --color=always $realpath'

# fzf (Ctrl-R history, Ctrl-T files, Alt-C dirs): fd respects .gitignore
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:200 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --color=always {}'"

if [ -f $HOME/.local/bin/bash.command-not-found ]; then
    . $HOME/.local/bin/bash.command-not-found
fi

# User exports
export HOST_HOME=/home/$USER
export EDITOR=nvim
export GIT_EDITOR=$EDITOR
export BAT_THEME="TwoDark"

# Aliases
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --date=relative"
alias dnfi="sudo dnf install"
alias dnfs="dnf search"
alias dnfu="sudo dnf update"
alias pip=pip3
alias vi=vim
alias vim=nvim
alias tailf="tail -f"
alias wgetc="wget --no-check-certificate"
alias xmlv="xmllint --format"
alias sshx="ssh -X"
# eza listings under their own names; ls/cat stay untouched so scripts and
# Claude Code's shell keep standard flags and output
alias ll="eza -l --git --icons --group-directories-first"
alias la="eza -la --git --icons --group-directories-first"
alias lt="eza --tree --level=2 --icons"

# ── RHOAI QE toolchain ─────────────────────────────────────────────────
# Local Jenkins (ods/jenkins local.sh) runs on podman; docker CLI maps to it.
export ENGINE=podman
command -v docker >/dev/null 2>&1 || alias docker=podman

# ── Auth prerequisites ─────────────────────────────────────────────────
# Declarations only. This file is committed to a public repo — NEVER put
# values here. Real values go in ~/.env (untracked, chmod 600), sourced below.
export GITLAB_HOST=""
export GITLAB_TOKEN=""
export AZURE_TENANT_ID=""
export AZURE_CLIENT_ID=""
export AZURE_CLIENT_SECRET=""
export AZURE_SUBSCRIPTION_ID=""
export DEV_PASSWORD=""          # local Jenkins `dev` user password

[[ -f ~/.env ]] && source ~/.env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

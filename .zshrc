# Add deno completions to search path
if [[ ":$FPATH:" != *":/root/.zsh/completions:"* ]]; then export FPATH="/root/.zsh/completions:$FPATH"; fi
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

zinit cdreplay -q

zinit snippet OMZP::git
zinit snippet OMZP::cabal
zinit snippet OMZP::stack
zinit snippet OMZP::command-not-found

export PATH="$HOME/.local/bin:$PATH"

ALIASING="${XDG_DATA_HOME:-${HOME}/.config}/alias"

if [[ ! -d "$ALIASING" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/LitFill/my-alias.git "$ALIASING"
fi

source "${ALIASING}/alias.sh"

OMP_THEME="${XDG_DATA_HOME:-${HOME}/.config}/ohmyposh/lit.json"
if [[ -f "$OMP_THEME" ]]; then
    eval "$(oh-my-posh init zsh --config $OMP_THEME)"
else
  git clone https://github.com/LitFill/ohmyposh.git "$(dirname $OMP_THEME)"
fi
# eval "$(oh-my-posh completion zsh)"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt sharehistory

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd=j zsh)"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.pack/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export LANG=id_ID.UTF-8
export LC_ALL=id_ID.UTF-8
export TZ='Asia/Jakarta'
export EDITOR='nvim'
export TMUX_TMPDIR='/tmp'
export BROWSER=/usr/bin/zen-browser

# fastfetch -c ~/10.jsonc

# eval "$(opam env)"


[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

# Ensure required CLI tools are installed
required_tools=("git" "zoxide" "fzf" "opam" "oh-my-posh" "nvim" "ghcup")
for tool in "${required_tools[@]}"; do
  if ! command -v "$tool" &>/dev/null; then
    echo "Warning: '$tool' is not installed. Please install it to fully utilize this configuration."
  fi
done

if [ -f "/root/.deno/env" ]; then
    . "/root/.deno/env";
fi

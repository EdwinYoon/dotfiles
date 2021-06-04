export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH="$HOME/.cargo/bin:$PATH" 
export PATH="$PATH:/usr/local/go/bin"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# FZF CONFIGS
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'" export GATA_ROOT="$HOME/gataweb"
export TERM='screen-256color'

# NVIMRC PATH
export NVIM_ROOT="$HOME/dotfiles/nvim"
export NVIMRC="$NVIM_ROOT/init.vim"
export ONELOCAL_ROOT="$HOME/onelocal"

# Language Setup
export LANG="en_US.UTF-8"

# Reduce the delay after you press <ESC>
export KEYTIMEOUT=5           

DISABLE_AUTO_TITLE="true"

HISTSIZE=10000
SAVEHIST=10000

# Alacritty Completion and functions path
fpath+=$HOME/.zsh/.zsh_functions

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# PURE PROMPT SETUP
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure
ZSH_THEME=""

# ZSH PLUGINS
plugins=(
  git
  colored-man-pages
  zsh-vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

function zvm_after_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# Auto ls after cd 
function chpwd() {
  exa -a -l 
}

function gata() {
  sh "$ONELOCAL_ROOT/onelocal_platform_local.sh"
}

# Read .nvmrc after change directory
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
     echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# RELOAD 
source $ZSH/oh-my-zsh.sh 

# Aliases 
alias alac="nvim ~/.config/alacritty/alacritty.yml"
#alias code='open -b com.microsoft.VSCode "$@"'
alias debug_alac="RUST_BACKTRACE=1 alacritty -vvv"
alias ls="exa -a -l" 
alias open="xdg-open"
alias reload="source ~/.zshrc"
alias settings="nvim ~/.config/nvim/init.vim"
alias tmux_clean="tmux kill-server"
alias v="nvim"
alias zshc="nvim ~/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZSH="/Users/yogesh/.oh-my-zsh"

ZSH_THEME="yogeshlonkar"

CASE_SENSITIVE="true"

# ENABLE_CORRECTION="true"
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
  autojump
  aws
  fzf
  git
  go
  golang
  helm
  node
  npm
  nvm
  terraform
  vault
  vi-mode
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
setopt menu_complete
setopt list_rows_first

bindkey "\C-k" history-beginning-search-backward
bindkey "\C-j" history-beginning-search-forward
source ~/.yrl_environment
source ~/.yrl_secrets
source ~/.yrl_utils
source ~/.yrl_aliases
PROG=dazn
_CLI_ZSH_AUTOCOMPLETE_HACK=1
source ~/zsh_autocomplete

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

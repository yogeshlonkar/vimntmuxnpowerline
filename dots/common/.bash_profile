shopt -s histappend

source ~/.yrl_environment

source ~/.yrl_secrets

source ~/.yrl_utils

source ~/.yrl_aliases

source ~/.yrl_complete

##### fix issue for editing-mode vi
__fzf_rebind() {
  if [ -z "$(set -o | grep '^vi.*on')" ]; then
    bind '"\C-x\C-t": " \C-u \C-a\C-k$(__fsel_tmux)\e\C-e\C-y\C-a\C-d\C-y\ey\C-h"'
  else
    bind '"\C-x\C-t": "\e$a \eddi$(__fsel_tmux)\C-x\C-e\e0P$xa"'
  fi
}
if [[ "$-" =~ "i" ]]; then
  bind -x '"\C-x\C-f": __fzf_rebind'
  bind '"\C-t": "\C-x\C-f\C-x\C-t"'
fi


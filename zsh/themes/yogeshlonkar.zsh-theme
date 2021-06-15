_collapsed_pwd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}
_job_count() {
  local stopped=$(jobs -sp | wc -l | tr -d '[:space:]')
  local running=$(jobs -rp | wc -l | tr -d '[:space:]')
  local sts=""
  if ((running)); then
    sts+="%{$fg[red]%}${running} 契"
  fi
  if ((stopped)); then
    if ((running)); then
      sts+="| "
    fi
    sts+="%{$fg[yellow]%}${stopped} 栗"
  fi
  sts+="%{$reset_color%} "
  ((running+stopped)) && echo -n "${sts}"
}
PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+='%{$reset_color%}%{$fg[cyan]%}$(_job_count)$(_collapsed_pwd)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

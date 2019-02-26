export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
LYELLOW='\[\033[93m\]'
CYAN='\[\033[36m\]'
PS_CLEAR='\[\033[0m\]'
export PS1="${LYELLOW}\u@\h:${CYAN}\W${PS_CLEAR}\$ "
### Default
# export PS1=\h:\W \u\$

# Alias
alias hlt="helm template . | vim - \"+set filetype=yaml\""
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9229"
alias docker-cleanup="docker rmi \$(docker images | grep -e \"<none>\" | awk '{print \$3}')"
alias ll="ls -lShr"

# Environment variables
[ -f "$(/usr/libexec/java_home 2>/dev/null)" ] && export JAVA_HOME=$(/usr/libexec/java_home) && export PATH="$JAVA_HOME/bin:$PATH"
[ -d '/usr/local/Cellar/maven/3.6.0/' ] && export M2_HOME=/usr/local/Cellar/maven/3.6.0/libexec && export PATH="$M2_HOME/bin:$PATH"
[ -d '/usr/local/opt/mongodb@3.6/' ] && export PATH="/usr/local/opt/mongodb@3.6/bin:$PATH"
[ -d '/usr/local/opt/node' ] && export PATH="/usr/local/opt/node/bin:$PATH"
if [ -d '/usr/local/lib/python2.7/site-packages' ]; then export POWERLINE_PACKAGE_DIR=/usr/local/lib/python2.7/site-packages; fi

# bash completions
[ -f '~/.git-completion.bash' ] && source ~/.git-completion.bash
[ -f '~/google-cloud-sdk/path.bash.inc' ] && source '~/google-cloud-sdk/path.bash.inc'
[ -f '~/google-cloud-sdk/completion.bash.inc' ] && source '~/google-cloud-sdk/completion.bash.inc'
if [ type helm >/dev/null 2>&1 ]; then source <(helm completion bash); fi
[ -f "$(brew --prefix)/etc/bash_completion" ] && . $(brew --prefix)/etc/bash_completion
[ -f '/usr/local/aws/bin/aws_completer' ] && complete -C '/usr/local/aws/bin/aws_completer' aws
[ -f '/usr/local/bin/vault' ] && complete -C /usr/local/bin/vault vault
[ -f '/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash' ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
[ -f '/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash' ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
[ -f ~/.aliases ] && source ~/.aliases

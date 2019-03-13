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

# Useful functions
function fstrigger()
{
	if [[ "$#" -ne 2 ]]; then
		echo -e "Usage:\nfstrigger paths command\nExecute command on file/directory change event of given paths"
		return 1
	fi
	fswatch -o $1 | while read -d 1; do `$2`; echo -e "\ndone"; done
}

# Environment variables
[ -d '/usr/local/opt/mongodb@3.6/' ] && export PATH="/usr/local/opt/mongodb@3.6/bin:$PATH"
[ -d '/usr/local/opt/node' ] && export PATH="/usr/local/opt/node/bin:$PATH"

# bash completions
[ -f ~/google-cloud-sdk/path.bash.inc ] && source ~/google-cloud-sdk/path.bash.inc
[ -f ~/google-cloud-sdk/completion.bash.inc ] && source ~/google-cloud-sdk/completion.bash.inc
if type helm >/dev/null 2>&1; then source <(helm completion bash); fi
[ -f ~/.git-completion.bash ] && source ~/.git-completion.bash
[ -f '/usr/local/aws/bin/aws_completer' ] && complete -C '/usr/local/aws/bin/aws_completer' aws
[ -f '/usr/local/bin/vault' ] && complete -C /usr/local/bin/vault vault
[ -f '/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash' ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
[ -f '/usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash' ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash

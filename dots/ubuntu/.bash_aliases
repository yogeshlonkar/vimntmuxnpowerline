# Alias
alias hlt="helm template . | vim - \"+set filetype=yaml\""
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9229"
alias docker-cleanup="docker rmi \$(docker images | grep -e \"<none>\" | awk '{print \$3}')"
alias ll="ls -lShr"
alias fstrigger=""
alias xclip="xclip -sel clip"

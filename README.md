Vim, Tmux, Powerline, Aireline Setup 
=====================================
This will instainstall vim, tmux, [powerline](https://powerline.readthedocs.io/en/latest/index.html#powerline), [vim-airline](https://github.com/vim-airline/vim-airline) and copy DOT files from this repo to user home using [Ansible](https://www.ansible.com/). Currently it only supported on *NIX environment

### Dependecies Auto-Installed
1. Ansible
1. Git
1. socat
1. pip packages
    1. psutil
    1. bzr
    1. pyuv
    1. i3ipc
    1. powerline-status

### Vim installation
For vim plugins are installed using [**Vundle**](https://github.com/VundleVim/Vundle.vim) example Aireline
There might be an Copy/Paste from System keyboard issue.
Please seee `.vimrc` for details

### Tmux installation
Please seee `.tmux.conf` for tmux configuration details
Vim, Tmux, Powerline, Aireline Setup 
=====================================
This will instainstall vim, tmux, [powerline](https://powerline.readthedocs.io/en/latest/index.html#powerline), [vim-airline](https://github.com/vim-airline/vim-airline) and copy DOT files from this repo to user home using [Ansible](https://www.ansible.com/). Currently it only supported on *NIX environment

### Install
1. Install [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html)
1. execute below (password for root user will be required)
```Shell
  chmod +x install.sh
  ./install.sh
```
### Things done by ansible
It installs below 
1. Git
1. socat
1. pip packages
    1. psutil
    1. bzr
    1. pyuv
    1. i3ipc
    1. powerline-status
It copies font file if system is LINUX else it clones [Powerline Fonts](https://github.com/powerline/fonts) in `/tmp/` direcory and executes `/tmp/fonts/install.sh`
### Vim installation
For vim plugins are installed using [**Vundle**](https://github.com/VundleVim/Vundle.vim), example Aireline.
*There might be an Copy/Paste from System keyboard issue.*
Please see `.vimrc` for details

### Tmux installation
Please see `.tmux.conf` for tmux configuration details

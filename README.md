Vim, Tmux, Powerline, Aireline Automated Setup 
=====================================
This will instainstall brew, vim, tmux, [powerline](https://powerline.readthedocs.io/en/latest/index.html#powerline) & its fonts, [vim-airline](https://github.com/vim-airline/vim-airline), ruby, vim & tmux plugins, copy DOT files from this repo to user home directory using [Ansible](https://www.ansible.com/). It is [Tested On](#tested-on)

### Requirements
- [Ansible](http://docs.ansible.com/ansible/latest/intro_installation.html) >= 2.3

### Steps
1. execute below
```Shell
   $ ./install
```


***Installation might take more than 30 minutes depending on your internet connection***

### Things done by ansible
- It installs below through package manager
  1. Tmux
  1. Git
  1. socat
- Update [pip](https://pypi.python.org/pypi/pip)
- Install vim flavour through package manager
- Install below pip packages
    1. psutil
    1. pyuv
    1. i3ipc
    1. [powerline-status](https://powerline.readthedocs.io/en/latest/)
- Install [Vundle](https://github.com/VundleVim/Vundle.vim) & [TPM](https://github.com/tmux-plugins/tpm)
  - [Command-t](https://github.com/wincent/command-t) Plugin required Ruby so it is installed through package manager
- Install [Powerline Fonts](https://github.com/powerline/fonts) using `/tmp/` direcory
- Copy `.vimrc` to home directory & Install plugins defined in it
- Copy `.tmux.conf` to home directory & Install plugins defined in it
  - Add `POWERLINE_PACKAGE_DIR` env variable to
    1. `/etc/environment` or `/etc/launchd.conf`
    1. `.bashrc`
    1. `~/.bash_profile`

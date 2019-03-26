My Setup 
=====================================
Setup terminal environents for macos/ubuntu

![tmux-powerline-bar](tmux-bar.png)

## MacOS
On macos below steps executed
1. Install xcode
1. Install brew and packages mainly macvim, python, git, bash, tmux
1. Install nerdfonts required for custom tmux-powerline status bar
1. Install Powerline_Pro theme. Default theme needs to be set manually
1. Copy [common](dots/common) and [macos specific](dots/macos) dot files
1. Install vim & tmux plugins

## Ubuntu
On ubuntu below steps executed
1. Install apt packages mainly macvim, python, git, bash, tmux, build essentials
1. Clone and compile vim from source
1. Install DejaVuSansMono Nerd font required for custom tmux-powerline status bar
1. Change default terminal font
1. Copy [common](dots/common) and [macos specific](dots/ubuntu) dot files
1. Install vim & tmux plugins

## Setup 
Clone or download zip and Execute below in source directory
```Shell
$ ./setup
```
***Installation might take more than 30 minutes based on internet connection. In case of ubuntu might need execute setup multiple times if connection resets while downloading apt packages***

## VIM - Custom Key bindings
| Keys | Action/Description |
| -- | -- |
| <kbd>ctrl</kbd> + <kbd>c</kbd> | Copy visually selection to clipboard |
| <kbd>ctrl</kbd> + <kbd>h</kbd> | Window Move Left |
| <kbd>ctrl</kbd> + <kbd>j</kbd> | Window Move Down |
| <kbd>ctrl</kbd> + <kbd>k</kbd> | Window Move Up |
| <kbd>ctrl</kbd> + <kbd>l</kbd> | Window Move Right |
| <kbd>ctrl</kbd> + <kbd>n</kbd> | Toggle nerd tree window|
| <kbd>ctrl</kbd> + <kbd>e</kbd> | Show Current file in nerd tree |
| <kbd>\\</kbd> then <kbd>t</kbd> | Search files in current workspace using `FZF` |
| <kbd>\\</kbd> then <kbd>f</kbd> | Search file based on content in current workspace using `The silver search` |
| <kbd>\\</kbd> then <kbd>l</kbd> | Show/Select open file list |

## TMUX - Custom Key bindings
Mouse selection in tmux will auto copy selection to clipboard. All below keys send after tmux default send key <kbd>ctrl</kbd> + <kbd>b</kbd>

| Keys | Actions/Description |
| -- | -- |
| <kbd>send-key</kbd> + <kbd>r</kbd> | Reloaded ~/.tmux.conf |
| <kbd>send-key</kbd> + <kbd>\|</kbd> | Split Window horizontaly with current pwd |
| <kbd>send-key</kbd> + <kbd>-</kbd> | Split Window verticaly with current pwd |
| <kbd>send-key</kbd> + <kbd>y</kbd> | Synchronize all panes in current window |
| <kbd>send-key</kbd> + <kbd>h</kbd> | Select Left pane |
| <kbd>send-key</kbd> + <kbd>j</kbd> | Select Down pane |
| <kbd>send-key</kbd> + <kbd>k</kbd> | Select Up pane |
| <kbd>send-key</kbd> + <kbd>l</kbd> | Select Right pane |
| <kbd>send-key</kbd> then <kbd>H</kbd> | Resize pane left  10 |
| <kbd>send-key</kbd> then <kbd>J</kbd> | Resize pane down 10 |
| <kbd>send-key</kbd> then <kbd>K</kbd> | Resize pane up 10 |
| <kbd>send-key</kbd> then <kbd>L</kbd> | Resize pane right 10 |

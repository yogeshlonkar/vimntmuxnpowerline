set shell=/usr/bin/env\ zsh
set nocompatible
filetype off

set rtp+=/usr/local/opt/fzf
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
call vundle#end()
filetype plugin indent on

if $TMUX == ''
  set clipboard+=unnamed
endif

if &term == "screen"
  set t_Co=256
endif

"mouse support
set mouse=a
syntax on
set encoding=utf8
let base16colorspace=256
set t_Co=256
set background=dark
colorscheme delek

" indentation
" set noexpandtab
set expandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=2
set shiftround
set autoindent
set smartindent

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch
set mat=2

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins start
Plugin 'benmills/vimux'
Plugin 'chriskempson/base16-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kien/ctrlp.vim' " fuzzy find files
Plugin 'pangloss/vim-javascript'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'wincent/command-t'
Plugin 'chase/vim-ansible-yaml'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'

" Plugins end
call vundle#end()            " required
filetype plugin indent on    " required

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'

if $TMUX == ''
    set clipboard+=unnamed
endif

if &term == "screen"
	set t_Co=256
endif
"mouse support
set mouse=a
"copy usint ctrl+c while in visual mode
vmap <C-c> "+y

" code folding settings
set foldmethod=manual " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Searching
set ignorecase
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch
set nolazyredraw " don't redraw while executing macros

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

syntax on

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme delek

set number
set autoindent " for new line
set smartindent
set laststatus=2 " show the satus line all the time
" space is space
set listchars=tab:▸\ ,trail:☠,nbsp:•,precedes:←,extends:→,eol:$,space:˙


""""""""""""""""""""
" plungins config  "
"""""""""""""""""""'
" ignore node_modules from buffer for CommandT
let g:CommandTWildIgnore = &wildignore
let g:CommandTWildIgnore .= ',*/.git'
let g:CommandTWildIgnore .= ',*/.hg'
let g:CommandTWildIgnore .= ',*/bower_components'
let g:CommandTWildIgnore .= ',*/node_modules'
let g:CommandTWildIgnore .= ',*/tmp'

" vim-ansible-yaml
let g:ansible_options = {'ignore_blank_lines': 0}

" close NERDTree after a file is opened
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeQuitOnOpen=0
" show hidden files in NERDTree
let NERDTreeShowHidden=1
" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>
" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>

" jsx plugin
let g:jsx_ext_required = 0

let g:user_emmet_settings = {
			\  'javascript' : {
			\      'extends' : 'jsx',
			\  },
			\}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>

" Window movement shortcuts
" move to the window in the direction shown, or create a new window
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

set shell=/bin/bash
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=ansible foldmethod=indent

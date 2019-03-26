set shell=/usr/bin/env\ bash
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins start
Plugin 'benmills/vimux'
Plugin 'chase/vim-ansible-yaml'
Plugin 'chriskempson/base16-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive' " the ultimate git helper
Plugin 'tpope/vim-commentary' " comment/uncomment lines with gcc or gc in visual mode
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugins end
call vundle#end()            " required

filetype plugin indent on    " required

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
let base16colorspace=256  " Access colors present in 256 colorspace"
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors"
set background=dark
colorscheme delek

" indentation
set noexpandtab " tabs ftw
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=2 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set autoindent " for new line
set smartindent

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

" space is space
set listchars=tab:▸\ ,trail:☠,nbsp:•,precedes:←,extends:→,eol:$,space:˙


set number
set laststatus=2 " show the satus line all the time


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plungins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" chase/vim-ansible-yaml
let g:ansible_options = {'ignore_blank_lines': 0}

" scrooloose/nerdtree
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2

" expand to the path of the file in the current buffer
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "﯁",
    \ "Untracked" : "",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "!",
    \ "Deleted"   : "-",
    \ "Dirty"     : "",
    \ "Clean"     : "",
    \ 'Ignored'   : '',
    \ "Unknown"   : ""
    \ }
" fzf

let $FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore node_modules --ignore Library --ignore static-builds -U -g ""'

" mattn/emmet-vim
let g:user_emmet_settings = {
    \  'javascript' : {
    \    'extends' : 'jsx',
    \  },
    \}

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"copy usint ctrl+c while in visual mode
vmap <C-c> "+y
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>
map <C-n> :NERDTreeToggle<cr>
map <C-b> :NERDTreeFind<cr>
nnoremap <leader>t :FZF<cr>
nnoremap <leader>f :Ag<cr>
nnoremap <leader>l :Windows<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=ansible foldmethod=indent

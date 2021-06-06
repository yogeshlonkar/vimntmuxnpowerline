set shell=/usr/bin/env\ zsh

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
" Plugins start
Plugin 'Chiel92/vim-autoformat'
Plugin 'hashivim/vim-terraform'
Plugin 'honza/vim-snippets'
Plugin 'junegunn/fzf.vim'
Plugin 'mg979/vim-visual-multi', {'branch': 'master'}
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugins end
call vundle#end()

set nocompatible
set encoding=utf8
filetype off
filetype plugin indent on
syntax on

if $TMUX == ''
  set clipboard+=unnamed
endif

"mouse support
set mouse=a

" let base16colorspace=256
set t_Co=256
set background=dark
colorscheme delek
set scrolloff=2

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

" code folding settings
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
highlight Folded ctermfg=130 ctermbg=238

set splitright

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch
set mat=2

" space is space
set listchars=tab:▸\ ,trail:☠,nbsp:☠,precedes:←,extends:→,eol:$,space:˙

set hidden
set number
set relativenumber
set laststatus=2

if !has('nvim')
  set completeopt+=popup
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plungins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-j>"

" scrooloose/nerdtree
let NERDTreeIgnore=['.git$[[dir]]', '.swp']
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowHidden=1
let g:NERDTreeChDirMode=2
" expand to the path of the file in the current buffer
let g:NERDTreeGitStatusIndicatorMapCustom = {
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

" Valloric/YouCompleteMe
let g:ycm_always_populate_location_list = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_gopls_binary_path = "$HOME/go/bin/gopls"
" let g:ycm_log_level = 'debug'

" fzf
let $FZF_DEFAULT_COMMAND='ag --hidden --ignore \*.swp --ignore .git --ignore node_modules/ --ignore .terraform --ignore converage/ -U -g ""'

" hashivim/vim-terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"copy usint ctrl+c while in visual mode
nnoremap<f8> :try<bar>lnext<bar>catch /^Vim\%((\a\+)\)\=:E\%(553\<bar>42\):/<bar>lfirst<bar>endtry<cr>
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>
map <expr> <C-m> g:NERDTree.IsOpen() == 0 ? ":NERDTreeFind<cr>" : ":NERDTreeClose<cr>"
vmap <C-c> "+y<cr>
nmap <leader>p "_ciw<esc>p
nnoremap <leader>f :Files<cr>
nnoremap <leader>F :Ag<cr>
nnoremap <leader>b :Lines<cr>
nnoremap <leader>l :Buffers<cr>

noremap <leader>n <esc>:call ArgumentSubstitution()<cr>
inoremap <C-9> <esc>:call ArgumentSubstitution()<cr>
nmap gt :bn<cr>
nmap gT :bN<cr>
nmap <leader>h <plug>(YCMHover)
nmap gd :YcmCompleter GoTo<cr>

"replace brackets, quotes
nmap <leader>r' :call WrapIn("'", "\"")<cr>
nmap <leader>r" :call WrapIn("\"", "'")<cr>
nmap <leader>r` :call WrapIn("`", "w")<cr>
nmap <leader>r{ :call WrapIn("{", "w")<cr>
nmap <leader>r[ :call WrapIn("[", "w")<cr>
nmap <leader>r( :call WrapIn("(", "w")<cr>

:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q

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

function! WrapIn(to, default)
  " TODO: fix bug with word on end of the line
  let l:from = input("Replace " . a:to . " with --> ", a:default)
  echomsg "WrapIn from --> " . l:from . " to --> " . a:to
  let include = strpart(l:from, 1, 1)
  let l:from = strpart(l:from, 0, 1)
  let l:winview = winsaveview()
  execute "normal vi" . l:from
  normal! "xy
  execute "normal di" . l:from
  if l:from != "w" && include != "+"
    execute "normal xx"
  endif
  execute "normal i" . a:to
  normal! "xp
  if a:to == "{"
    execute "normal a}"
  elseif a:to == "["
    execute "normal a]"
  elseif a:to == "("
    execute "normal a)"
  else
    execute "normal a" . a:to
  endif
  call winrestview(l:winview)
endfunction

function! ArgumentSubstitution()
  let l:currcol = col('.')
  let l:currline = getline('.')
  let l:currchar = l:currline[l:currcol-1]
  let l:prevtocurrcol = join(reverse(split(strpart(l:currline,0, l:currcol), '.\zs')), '')
  let l:preopeningparetheses = matchend(l:prevtocurrcol, '(')
  let l:nextcomma = matchend(strpart(l:currline, l:currcol), ',')
  if l:currchar == ','
    normal! l
  elseif l:nextcomma > -1 && l:nextcomma < l:preopeningparetheses
    normal! f,l
  elseif l:preopeningparetheses == -1
    let l:nextopeningparetheses = matchend(strpart(l:currline, l:currcol), '(')
    if l:nextopeningparetheses == -1
      return
    else
      normal! f(l
    endif
  else
    normal! F(l
  endif
  let l:currcol = col('.')
  let l:currpos = getpos('.')[0:2]
  let l:nextcomma = matchend(strpart(l:currline, l:currcol), ',')
  let l:nextclosingparetheses = matchend(strpart(l:currline, l:currcol), ')')
  if l:nextcomma != -1 && l:nextcomma < l:nextclosingparetheses
    let l:nextcol = l:currcol + l:nextcomma - 1
  else
    let l:nextcol = l:currcol + l:nextclosingparetheses - 1
  endif
  let l:newpos = add(l:currpos[0:1], l:nextcol)
  call setpos("'<", l:currpos)
  call setpos("'>", l:newpos)
  normal! gv
endfunction

function! RemoveTrailingSpaces()
  execute '%s/ *$//g'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType gitcommit setlocal spell
autocmd BufNewFile,BufReadPost *.{md,txt},README setlocal spell
autocmd BufWrite *.{tf,go} :Autoformat
autocmd BufWritePost *.go YcmForceCompileAndDiagnostics
autocmd BufEnter *.{tf,go,sh,json,yaml,yml} set foldmethod=syntax
autocmd BufEnter /usr/local/Cellar/neovim/*/share/nvim/runtime/doc/*.txt  setlocal nospell

"
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

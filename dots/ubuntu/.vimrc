set shell=/usr/bin/env\ bash
set nocompatible
filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins start
Plugin 'benmills/vimux'
Plugin 'chase/vim-ansible-yaml'
Plugin 'Chiel92/vim-autoformat'
Plugin 'chriskempson/base16-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'mattn/emmet-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugins end
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
set noexpandtab
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set autoindent
set smartindent

" code folding settings
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=1

" Searching
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set showmatch
set mat=2

" space is space
set listchars=tab:▸\ ,trail:☠,nbsp:•,precedes:←,extends:→,eol:$,space:˙
set backspace=indent,eol,start

set number
set laststatus=2


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
map <f8> :call NextIssue()<cr>
map <C-h> :call WinMove('h')<cr>
map <C-j> :call WinMove('j')<cr>
map <C-k> :call WinMove('k')<cr>
map <C-l> :call WinMove('l')<cr>
map <expr> <C-n> g:NERDTree.IsOpen() == 0 ? ":NERDTreeFind<cr>" : ":NERDTreeClose<cr>"
vmap <C-c> "+y<cr>
nmap <leader>p "_ciw<esc>p
nnoremap <leader>t :FZF<cr>
nnoremap <leader>f :Ag<cr>
nnoremap <leader>l :Windows<cr>
map <C-@> <esc>:call ArgumentSubstitution()<cr>
imap <C-@> <esc>:call ArgumentSubstitution()<cr>


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

function! NextIssue() abort
	let l:hasLspError = 0
	if exists(":LspNextError")
		exec ':LspNextError'
		let l:hasLspError = lsp#ui#vim#diagnostics#get_diagnostics_under_cursor()
	endif
	if &spell && l:hasLspError == 0
		normal! ]s
	endif
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
autocmd BufNewFile,BufReadPost *.{md,txt},README setlocal spell
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=ansible foldmethod=indent


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disable Arrow keys in Insert & Escape mode :D
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

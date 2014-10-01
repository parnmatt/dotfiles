set nocompatible
filetype off

" Initialise Vundle (bundle/plugin package manager)
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle manage self
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'godlygeek/csapprox'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'parnmatt/vim-root'
Plugin 'tejr/vim-tmux'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-capslock'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-obsession'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'whatyouhide/vim-lengthmatters'

if has('python') || has('python3')
    Plugin 'SirVer/ultisnips'
    Plugin 'sjl/gundo.vim'
endif


call vundle#end()
filetype plugin indent on

set autoindent
set autoread
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set wrap
set linebreak
set hlsearch
set splitbelow
set splitright
set hidden

" airline
set laststatus=2
if has("gui_running")
	if has("gui_gtk2")
		set guifont=Sauce\ Code\ Powerline\ 11
	else
		set guifont=Sauce\ Code\ Powerline:h11
	endif
endif
let g:airline_powerline_fonts = 1

" CtrlP
let g:ctrlp_arg_map = 1

" UltiSnips
let g:UltiSnipsEditSplit = "horizontal"
nnoremap <leader>u :UltiSnipsEdit<CR>

" Enable full backspace control
set backspace=indent,eol,start

" English spelling, disabled by default
set spell spelllang=en_gb
set nospell
nnoremap <leader>s 1z=
nnoremap <leader>[s [s1z=
nnoremap <leader>]s ]s1z=e

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·

" map jk to Esc
inoremap jk <Esc>

" Semicolon at end of line
nnoremap <leader>; A;<Esc>
inoremap <leader>; <C-o>A;<Esc>

" Turn off hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Prevent using arrow keys in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" autocommand support portability
" TODO consider encapsulating these
if has("autocmd")
	autocmd!

	" Source vimrc when saved
	autocmd bufwritepost $MYVIMRC source $MYVIMRC

	" Enable file type detection
	filetype on
	syntax enable

	" File Types
	autocmd BufNewFile,BufRead *.tex set filetype=tex
	autocmd filetype tex setlocal makeprg=latexmk\ -pdf\ %
	autocmd filetype tex setlocal iskeyword+=:,.,_
	autocmd filetype java setlocal makeprg=javac\ %
endif

" Colour scheme
set background=dark
silent! colorscheme base16-tomorrow

" Edit .vimrc
noremap <leader>v :tabedit $MYVIMRC<CR>

" Yank rest of line to follow the common convention
nnoremap Y y$

" Mapping for Gundo
nnoremap <F5> :GundoToggle<CR>

" Commands
:command! WQ wq
:command! Wq wq
:command! W  w
:command! Q  q

" Use par for formatting
set formatprg=par

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()
function! Stab()
	let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
	if l:tabstop > 0
		let &l:sts = l:tabstop
		let &l:ts = l:tabstop
		let &l:sw = l:tabstop
	endif
endfunction

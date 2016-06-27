set nocompatible
filetype off

" vim-plug installation helper
function! InstallPlug()
    echom 'Installing vim-plug'
    silent! call mkdir($HOME . '/.vim/autoload', 'p')
    silent! execute '!curl -fLo ' . $HOME . '/.vim/autoload/plug.vim '
                \ . 'https://raw.githubusercontent.com/'
                \ . 'junegunn/vim-plug/master/plug.vim'
endfunction

if !filereadable($HOME . '/.vim/autoload/plug.vim')
    call InstallPlug()
endif

" Initialise vim-plug (plugin package manager)
call plug#begin('~/.vim/plugged')

" Plugins
Plug 'tpope/vim-abolish'
Plug 'rking/ag.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/csapprox'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'jamessan/vim-gnupg'
Plug 'morhetz/gruvbox'
Plug 'whatyouhide/vim-lengthmatters'
Plug 'dzeban/vim-log-syntax'
Plug 'tpope/vim-markdown'
Plug 'benekastah/neomake'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'parnmatt/vim-root', {'branch': 'develop'}
Plug 'tpope/vim-speeddating'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/switch.vim'
Plug 'godlygeek/tabular'
Plug 'tejr/vim-tmux'
Plug 'tpope/vim-unimpaired'
Plug 'nelstrom/vim-visual-star-search'

if has('python') || has('python3')
    Plug 'SirVer/ultisnips'
endif

call plug#end()

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
		set guifont=Inconsolata-g\ for\ Powerline\ 10
	else
		set guifont=Inconsolata-g\ for\ Powerline:h10
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
	autocmd BufWritePost $MYVIMRC source $MYVIMRC

    " Neomake on save
    autocmd BufWritePost * Neomake

	" Enable file type detection
	filetype on
	syntax enable

    " Mail
    autocmd filetype mail setlocal textwidth=72
    autocmd filetype mail setlocal formatoptions+=aw
    autocmd filetype mail setlocal formatprg=par\ w72qT4h
    autocmd filetype mail setlocal spell

    autocmd BufNewFile,BufRead *msmtprc* setlocal filetype=msmtp

	" LaTeX
	autocmd BufNewFile,BufRead *.tex set filetype=tex
	autocmd filetype tex setlocal makeprg=latexmk\ -pdf\ %
	autocmd filetype tex setlocal iskeyword+=:,.,_

    " Java
	autocmd filetype java setlocal makeprg=javac\ %

endif

" Colour scheme
set background=dark
silent! colorscheme gruvbox

" Edit .vimrc
noremap <leader>v :tabedit $MYVIMRC<CR>

" Yank rest of line to follow the common convention
nnoremap Y y$


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

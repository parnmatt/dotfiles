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
Plug 'bling/vim-airline'
Plug 'tpope/vim-capslock'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/csapprox'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-fugitive'
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

" file finding
set path+=**
set wildmenu

" searching
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" tags
set tags+=,./.tags,.tags

" turn off hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" file browsing
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()

" airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

if has("gui_running")
	if has("gui_gtk2")
		set guifont=Inconsolata-g\ for\ Powerline\ 10
	else
		set guifont=Inconsolata-g\ for\ Powerline:h10
	endif
endif

" UltiSnips
let g:UltiSnipsEditSplit = "horizontal"
nnoremap <leader>u :UltiSnipsEdit<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Enable full backspace control
set backspace=indent,eol,start

" English spelling, disabled by default
set spellfile=$HOME/.vim/spell/physics.en.utf-8.add
set spelllang=en_gb
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

" Prevent using arrow keys in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Neomake
let g:neomake_cpp_cppcheck_maker = {
    \ 'args': ['-q', '--enable=style', '%:p'],
    \ 'errorformat':
        \ '[%f:%l]: (%trror) %m,' .
        \ '[%f:%l]: (%tarning) %m,' .
        \ '[%f:%l]: (%ttyle) %m,' .
        \ '[%f:%l]: (%terformance) %m,' .
        \ '[%f:%l]: (%tortability) %m,' .
        \ '[%f:%l]: (%tnformation) %m,' .
        \ '[%f:%l]: (%tnconclusive) %m,' .
        \ '%-G%.%#',
        \ }
let g:neomake_cpp_enabled_makers = ['gcc', 'cppcheck']

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

    " C/C++
    autocmd filetype c,cpp setlocal commentstring=//\ %s

	" LaTeX
	autocmd BufNewFile,BufRead *.tex setlocal filetype=tex
	autocmd filetype tex setlocal makeprg=latexmk\ -pdf\ %
	autocmd filetype tex setlocal iskeyword+=:,.,_

    " Markdown
    autocmd filetype markdown setlocal makeprg=cmark\ --smart\ --nobreaks\ %>%:r.html

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

" Remove accidental shift on common commands
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev QA qa
cnoreabbrev W w
cnoreabbrev Wa wa
cnoreabbrev WA wa
cnoreabbrev X x
cnoreabbrev Xa xa
cnoreabbrev XA xa

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

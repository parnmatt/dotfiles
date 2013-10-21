" Initialise Pathogen for bundles/plugins
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

set nocompatible
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set number
set wrap
set linebreak
set hlsearch
set hidden

" Enable full backspace control
set backspace=indent,eol,start

" English spelling, disabled by default
setlocal spell spelllang=en_gb
set nospell
nnoremap <leader>s 1z=
nnoremap <leader>[s [s1z=
nnoremap <leader>]s ]s1z=e

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·

" map jk to Esc
noremap jk <Esc>

" Shortcut to toggle hidden characters
nmap <leader>i :set list!<CR>

" Semicolon at end of line
inoremap <leader>; <C-o>A;<Esc>

" Quick movements
inoremap II <Esc>I
inoremap AA <Esc>A

" Prevent using arrow keys in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" autocommand support portability
if has("autocmd")
	autocmd!

	" Source vimrc when saved
	autocmd bufwritepost .vimrc source $MYVIMRC

	" Enable file type detection
	filetype on
	syntax enable

	" File Types
	autocmd BufNewFile,BufRead *.tex set filetype=tex
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

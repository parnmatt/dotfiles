runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype on
syntax enable
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set number
set wrap
set linebreak
set hlsearch

" English spelling, disabled by default
setlocal spell spelllang=en_gb
set nospell

" File Types
autocmd BufNewFile,BufRead *.md set filetype=markdown

set background=dark
colorscheme base16/colors/base16-tomorrow

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Yank rest of line to follow the common convention
nnoremap Y y$

" Mapping for Gundo
nnoremap <F5> :GundoToggle<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·

" Use par for formatting
set formatprg=par

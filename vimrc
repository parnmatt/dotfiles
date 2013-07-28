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

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Yank rest of line to follow the common convention
nnoremap Y y$

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·

" Use par for formatting
set formatprg=par

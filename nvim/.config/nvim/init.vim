autocmd!

" dein plugin manager
function! InstallPluginManager()
    echom 'Installing dein...'
    silent! call mkdir($XDG_CONFIG_HOME . '/nvim/dein', 'p')
    silent! execute '!curl --fail --location --output /tmp/dein.sh '
             \ . 'https://raw.githubusercontent.com/'
             \ . 'Shougo/dein.vim/master/bin/installer.sh'
    silent! execute '!sh /tmp/dein.sh ' . $XDG_CONFIG_HOME . '/nvim/dein'
endfunction

if !filereadable($XDG_CONFIG_HOME . '/nvim/dein/'
            \ . 'repos/github.com/Shougo/dein.vim/autoload/dein.vim')
    call InstallPluginManager()
endif

set runtimepath+=$XDG_CONFIG_HOME/nvim/dein/repos/github.com/Shougo/dein.vim
call dein#begin($XDG_CONFIG_HOME . '/nvim/dein')
call dein#add('Shougo/dein.vim')

" git helpers
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rhubarb')
call dein#add('airblade/vim-gitgutter')

" user interface and colours
call dein#add('bling/vim-airline')
call dein#add('godlygeek/csapprox')
call dein#add('morhetz/gruvbox')
call dein#add('Shougo/echodoc')
call dein#add('Konfekt/FastFold')

" filetype and syntax
call dein#add('jamessan/vim-gnupg')
call dein#add('dzeban/vim-log-syntax')
call dein#add('tpope/vim-markdown')
call dein#add('parnmatt/vim-root', {'rev': 'develop'})
call dein#add('Shougo/context_filetype.vim')

" completion and snippets
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neoinclude.vim')
" C / C++ / Objective-C / Objective-C++
" call dein#add('zchee/deoplete-clang')  " broken currently
" Python
call dein#add('zchee/deoplete-jedi')
" VimL
call dein#add('Shougo/neco-vim')
call dein#add('Shougo/neco-syntax')
" Zsh
call dein#add('zchee/deoplete-zsh')
" GitHub
call dein#add('SevereOverfl0w/deoplete-github')

" system
call dein#add('tpope/vim-capslock')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-obsession')

" editing
call dein#add('tpope/vim-abolish')
call dein#add('tpope/vim-commentary')
call dein#add('junegunn/vim-easy-align')
call dein#add('tpope/vim-endwise')
call dein#add('tommcdo/vim-exchange')
call dein#add('whatyouhide/vim-lengthmatters')
call dein#add('benekastah/neomake')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-speeddating')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('tpope/vim-surround')
call dein#add('AndrewRadev/switch.vim')
call dein#add('tpope/vim-unimpaired')
call dein#add('nelstrom/vim-visual-star-search')

call dein#end()

if dein#check_install()
    call dein#install()
endif

function! RemovePlugins()
    call map(dein#check_clean(), "delete(v:val, 'rf')")
endfunction

filetype plugin indent on
syntax enable

let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

set mouse=
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set listchars="tab:▸ ,trail:·,eol:¬,nbsp:∙"
set number
set relativenumber
set noshowmode
set wrap
set linebreak
set splitbelow
set splitright
set hidden
set inccommand=split

" file finding
set path+=**

" searching
set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

" tags
set tags+=,./.tags,.tags

" Edit .vimrc
noremap <leader>v :tabedit $MYVIMRC<CR>

" Prevent using arrow keys in insert mode
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" map jk to Esc
inoremap jk <Esc>

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

" turn off hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" colour scheme
set background=dark
silent! colorscheme gruvbox

" file browsing
let g:netrw_banner = 0
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_list_hide = netrw_gitignore#Hide()

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" deoplete
call deoplete#enable()
" deolete-github
let g:deoplete#sources.gitcommit = ['github']
let g:deoplete#keyword_patterns.gitcommit = '.+'
call deoplete#util#set_pattern(
            \ g:deoplete#omni#input_patterns,
            \ 'gitcommit', [g:deoplete#keyword_patterns.gitcommit])

" echodoc
call echodoc#enable()

" UltiSnips
let g:UltiSnipsEditSplit = "horizontal"
nnoremap <leader>u :UltiSnipsEdit<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" English spelling, disabled by default
set spellfile=$XDG_CONFIG_HOME/nvim/spell/physics.en.utf-8.add
set spelllang=en_gb
set nospell
nnoremap <leader>s 1z=
nnoremap <leader>[s [s1z=
nnoremap <leader>]s ]s1z=e

" Use par for formatting
set formatprg=par

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

" Close preview window
autocmd CompleteDone * pclose
autocmd TermOpen * LengthmattersReload

" Source vimrc when saved
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" Neomake on save
autocmd BufWritePost * Neomake

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

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* SetTab call SetTab()
function! SetTab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
endfunction

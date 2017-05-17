" To install Pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle; \
" curl -so ~/.vim/autoload/pathogen.vim \
"    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
call pathogen#infect()

syntax enable
set background=dark

" To install wombat:
" mkdir ~/.vim/colors
" curl -so ~/.vim/colors/wombat.vim http://www.vim.org/scripts/download_script.php?src_id=6657
if filereadable(glob("~/.vim/colors/wombat.vim"))
    colorscheme wombat
endif

filetype on
filetype plugin on
filetype indent on

set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set smartindent
set autoindent
set smarttab

set scrolloff=2
set showmatch

set textwidth=79
set formatoptions=qrn1

" Git commit messages should break at 72.
autocmd Filetype gitcommit setlocal textwidth=72 formatoptions=cqt
autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

set mouse=a

set encoding=utf-8
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nu
set foldmethod=indent

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

" Open vertical splits to the right by default
set splitright

let mapleader = ","
let maplocalleader = ","

" Hit jj to get out of insert mode.
inoremap jj <ESC>

autocmd BufRead,BufNewFile * set formatoptions-=cro

" Leader-space to clear highlighted search.
nnoremap <leader><space> :noh<cr>

" Trim trailing whitespace automatically when saved.
autocmd BufWritePre * :%s/\s\+$//e

" Restore position when reopening file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Highlight any trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
if version >= 702
    autocmd BufWinLeave * call clearmatches()
endif

autocmd Syntax * syn match ExtraWhitespace /\s\+$/

" Highlight text past 80 characters.
if exists('+colorcolumn')
    set colorcolumn=80
    autocmd Filetype gitcommit setlocal colorcolumn=72
endif

" Make <ins> a nice paste format.
set pastetoggle=<ins>
nnoremap <silent> <ins> :setlocal paste!<CR>i
autocmd InsertLeave <buffer> se nopaste

" Make F6 unit test the project and F7 build it
if filereadable('Makefile')
    nnoremap <F6> :!make test<CR>
    nnoremap <F7> :!make<CR>
elseif filereadable('build.xml')
    nnoremap <F6> :!phing test<CR>
    nnoremap <F7> :!phing build<CR>
endif

" Prettier linewrap.
set showbreak=↪

" Write as root.
cnoremap w!! w !sudo tee % >/dev/null

" Easier navigation between split windows.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Allow opening a tag in a vertical split with CTRL-\
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Read your local vim stuff.
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Set up for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd BufNewFile,BufRead *.json set ft=json
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['sassc']
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_json_checkers = ['jshint', 'jsonlint']
let g:syntastic_twig_twiglint_exec = 'php'
let g:syntastic_twig_twiglint_exe = 'php /usr/local/bin/twig-lint'

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

" ,l to lint a file.
:autocmd FileType php noremap <leader>l :w!<CR>:!clear;/usr/local/bin/php -l %<CR>
:autocmd FileType javascript noremap <leader>l :w!<CR>:!clear;/usr/local/bin/gjslint %<CR>

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

call pathogen#infect()

syntax enable
set background=dark
colorscheme wombat

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

set nocompatible
set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

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
" Allow opening a tag in a vertical split with CTRL-\
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

let mapleader = ","
let maplocalleader = ","

" Hit jj to get out of insert mode.
inoremap jj <ESC>

autocmd BufRead,BufNewFile * set formatoptions-=cro

" Leader-space to clear highlighted search.
nnoremap <leader><space> :noh<cr>

" Restore position when reopening file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Highlight any trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" Trim trailing whitespace automatically when saved.
autocmd BufWritePre * :%s/\s\+$//e
autocmd Syntax * syn match ExtraWhitespace /\s\+$/
" Don't insert two spaces after period when joining lines.
set nojoinspaces

" Highlight text past 80 characters.
if exists('+colorcolumn')
    set colorcolumn=80
    autocmd Filetype gitcommit setlocal colorcolumn=72
endif

" Prettier linewrap.
set showbreak=↪

" Make <ins> a nice paste format.
set pastetoggle=<ins>
nnoremap <silent> <ins> :setlocal paste!<CR>i
autocmd InsertLeave <buffer> se nopaste

let test#strategy = "vimterminal"
let test#vim#term_position = "below"
let test#php#phpunit#executable = "./vendor/bin/phpunit"
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>

" Write as root.
cnoremap w!! w !sudo tee % >/dev/null

" Set up Ctags and taglist.
set tags=./tags;$HOME
nnoremap <silent> <F8> :TlistToggle<CR>

" Allow opening a tag in a vertical split with CTRL-\.
map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Read your local vim stuff.
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

set timeoutlen=1000 ttimeoutlen=0

let b:ale_fixers = {'*': ['remove_trailing_lines']}
let g:ale_virtualtext_cursor = 'disabled'
" ctrl-j/k to jump between linter errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

nnoremap <silent> <F2> :FZF<CR>
set rtp+=/usr/local/bin/fzf

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
call plug#end()

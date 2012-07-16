" To install Pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle; \
" curl -so ~/.vim/autoload/pathogen.vim \
"    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
call pathogen#infect()

syntax enable
set t_co=256
set background=dark

" To install solarized:
" git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
colorscheme solarized

" To install fugitive
" git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

if has('autocmd')
    filetype on
    filetype plugin on
    filetype indent on
endif

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

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

autocmd BufRead,BufNewFile * set formatoptions-=cro
:autocmd FileType php noremap ,l :w!<CR>:!clear;/usr/local/bin/php -l %<CR>

" Trim trailing whitespace automatically when saved.
autocmd BufWritePre * :%s/\s\+$//e

" Highlight any trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd Syntax * syn match ExtraWhitespace /\s\+$/

" Make F2 a nice paste format.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Make F9 lint a PHP file.
:set makeprg=php\ -ln\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l
nnoremap <F9> :make<CR><CR>:cwindow<CR><C-w><C-w>

" Make F5 build the project.
nnoremap <F5> :!ant build<CR>

" Make F6 unit test the project.
nnoremap <F6> :!ant test-all<CR>

" Read your local vim stuff.
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

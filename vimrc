" To install Pathogen:
" mkdir -p ~/.vim/autoload ~/.vim/bundle; \
" curl -so ~/.vim/autoload/pathogen.vim \
"    https://raw.github.com/tpope/vim-pathogen/HEAD/autoload/pathogen.vim
call pathogen#infect()

let g:solarized_termcolors=256
syntax enable
set t_co=256
set background=dark

" To install solarized:
" git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
" To install wombat:
" mkdir ~/.vim/colors
" curl -so ~/.vim/colors/wombat.vim http://www.vim.org/scripts/download_script.php?src_id=6657
colorscheme wombat

" To install fugitive
" git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

" Install Syntastic
" git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic

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

set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

let mapleader = ","
let maplocalleader = ","

inoremap jj <ESC>

autocmd BufRead,BufNewFile * set formatoptions-=cro
:autocmd FileType php noremap ,l :w!<CR>:!clear;/usr/local/bin/php -l %<CR>

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
autocmd BufWinLeave * call clearmatches()

autocmd Syntax * syn match ExtraWhitespace /\s\+$/

" Highlight text past 80 characters.
if exists('+colorcolumn')
    set colorcolumn=80
endif

" Make <ins> a nice paste format.
set pastetoggle=<ins>
nnoremap <silent> <ins> :setlocal paste!<CR>i
autocmd InsertLeave <buffer> se nopaste

" Make F9 lint a PHP file.
:set makeprg=php\ -ln\ %
:set errorformat=%m\ in\ %f\ on\ line\ %l
nnoremap <F9> :make<CR><CR>:cwindow<CR><C-w><C-w>

" Make F6 unit test the project.
nnoremap <F6> :!phing test<CR>

" Prettier linewrap.
set showbreak=↪

" Write as root.
cnoremap w!! w !sudo tee % >/dev/null

" Read your local vim stuff.
if filereadable(glob("~/.vimrc.local"))
    source ~/.vimrc.local
endif

" Split window into columns
" From: https://coderwall.com/p/suj3fq
function! SplitByColumnSize(col)
    let l:s_s = &nu ? a:col + &numberwidth : a:col
    let l:s_t = winwidth(0) / l:s_s
    let l:s_c = 1

    " Split window s_t times
    while l:s_c < l:s_t
        vne
        wincmd w
        let l:s_c = l:s_c + 1
    endwhile

    wincmd H

    let l:s_c = 1

    " Resize splits
    while l:s_c < l:s_t
        exe 'vert resize '.l:s_s
        wincmd w
        let l:s_c = l:s_c + 1
    endwhile
endfunction

command Asplit call SplitByColumnSize(80)

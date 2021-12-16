syntax on
filetype plugin indent on

set autoindent
set autoread
set bg=dark
set clipboard=unnamedplus
set completeopt-=preview
set encoding=utf-8
set expandtab
set fileformat=unix
set incsearch
set mouse=n
set nocompatible
set noerrorbells
set noswapfile
set number relativenumber
set shiftwidth=4
set softtabstop=4
set splitright
set splitbelow
set tabstop=4 
set termguicolors

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    "editor
    Plug 'dense-analysis/ale'
    Plug 'unblevable/quick-scope'
    Plug 'ycm-core/YouCompleteMe'

    "navigation
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'

    "ui and theme
    Plug 'morhetz/gruvbox'
    Plug 'psliwka/vim-smoothie'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

call plug#end()

let g:airline_theme='gruvbox'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_trigger=1

colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

"compile and run
nmap<C-c> :!g++ % -Dbipinpathak -Wall -Wextra -pedantic -std=c++20 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector <Enter>
nmap<C-z> :!./a.out <Enter>
nmap<C-p> :!python3 % <Enter>

"window navigation
map<C-h> <C-w>h
map<C-j> <C-w>j
map<C-k> <C-w>k
map<C-l> <C-w>l

"fzf
nmap ; :Files<CR>

"editor
map <C-?>  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"auto
:autocmd BufNewFile *.cpp 0r ~/code_here/template.cpp 

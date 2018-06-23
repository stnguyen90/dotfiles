" setup and enable Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'matchit.zip'
Plugin 'scrooloose/nerdcommenter'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" fix Vundle script errors
set shell=bash

" turn on syntax highlighting
syntax on

" set width to 78
au BufRead,BufNewFile *.txt set tw=78

" turn on name of file in title
set title

" set the folding to fold based on indentations
set foldmethod=indent

" set the folding to fold based on syntax 
" set foldmethod=syntax

" save folding
au BufWinLeave * mkview
au BufWinEnter * silent loadview 

" turn line numbers on
set number

" highlight matching braces
set showmatch

" turn on case insensitive
set ignorecase
set smartcase

" use spaces instead of tabs
set expandtab

" be smart when using tabs
set smarttab

" set the tab/shift size
set tabstop=4
set softtabstop=0
set shiftwidth=4

" turn on mouse scrolling
set mouse=nvicr

" enable search highlighting
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

"Always show current position
set ruler 

"The commandbar height
set cmdheight=2 

" persistent undo
au BufWritePre /tmp/* setlocal noundofile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Always show the statusline
set laststatus=2

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ %=Line:\ %l/%L:%c

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

" set backspace to delete autoindents, line breaks, and over the start of insert
set backspace=indent,eol,start

" set some non printable characters
set listchars=trail:~,space:·,precedes:«,extends:»,eol:↲,tab:▸\
set list

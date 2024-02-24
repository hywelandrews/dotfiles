set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Scala lang plugin
Plugin 'derekwyatt/vim-scala'

" Vim colorschemes:
Plugin 'flazz/vim-colorschemes'

"dracula theme
Plugin 'dracula/vim'

" tcomment
Plugin 'tomtom/tcomment_vim'

" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'

" Markdown for Vim
Plugin 'gabrielelana/vim-markdown'

" Extra syntax highlighting, useful for C programming at least
Plugin 'justinmk/vim-syntax-extra'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set backspace=indent,eol,start

set background=dark

set encoding=utf-8

color dracula

" Enable completion where available.
let g:ale_completion_enabled = 1

" Automatic syntax highlighting for files
au BufRead,BufNewFile *.sbt           set filetype=scala
au BufRead,BufNewFile *.conf          set filetype=dosini
au BufRead,BufNewFile *.bash*         set filetype=sh
au BufRead,BufNewFile *.txt           set filetype=todo

" line numbers
set number
set relativenumber

" show title
set title
"Open NERDTree when nvim starts
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Toggle NERDTree with Ctrl-N
map <C-n> :NERDTreeToggle<CR>

"Show hidden files in NERDTree
let NERDTreeShowHidden=1

"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

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

" GruvBox theme
Plugin 'morhetz/gruvbox'

" tcomment
Plugin 'tomtom/tcomment_vim'

" A tree explorer plugin for vim
Plugin 'scrooloose/nerdtree'

" neovim rpc client working on vim8
Plugin 'roxma/vim-hug-neovim-rpc'

" Yet Another Remote Plugin Framework for Neovim *Vim8
Plugin 'roxma/nvim-yarp'

" Asynchronous Lint Engine
Plugin 'w0rp/ale'

" Markdown for Vim
Plugin 'gabrielelana/vim-markdown'

" UML Diagrams in VIM (Architect alert!)
Plugin 'scrooloose/vim-slumlord'

" PlantUML syntax (for the above plugin)
Plugin 'aklt/plantuml-syntax'

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

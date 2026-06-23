set nocompatible              " be iMproved, required
set nowrap
filetype off                  " required
syntax on
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
Bundle 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
" Markdown for vim
Plugin 'gabrielelana/vim-markdown'
" Scala lang plugin
Plugin 'derekwyatt/vim-scala'
" dracula theme
Plugin 'dracula/vim'
" Extra syntax highlighting, useful for C
Plugin 'justinmk/vim-syntax-extra'
"- All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set backspace=indent,eol,start

set background=dark

set encoding=utf-8

color dracula

" Color name (:help cterm-colors) or ANSI code
 let g:limelight_conceal_ctermfg = 'gray'
 let g:limelight_conceal_ctermfg = 240
"
" " Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'
"
" " Default: 0.5
" let g:limelight_default_coefficient = 0.7
"
" " Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1
"
" " Beginning/end of paragraph
" "   When there's no empty line between the paragraphs
" "   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'
"
" " Highlighting priority (default: 10)
" "   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
  set wrap
  set linebreak 
  Limelight
endfunction

function! s:goyo_leave()
  set nowrap 
  set nolinebreak 
  Limelight!
    " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" To ignore plugin indent changes, instead use:
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

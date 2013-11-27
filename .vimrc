if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" For Vundle"""
set nocompatible	
filetype on "Prevents stock OS X vim from exiting with error
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-commentary'
Bundle 'vim-ruby/vim-ruby'
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'

"Require additional steps to complete installation. Check plugin homepage.
Bundle 'Valloric/YouCompleteMe' 

" vim-scripts repos
"  e.g., Bundle 'L9'
Bundle 'copypath.vim'
" non github repos
"  e.g., Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Required for vim-ruby
filetype on 
filetype indent on
filetype plugin on

" Open a NERDTree automatically when vim starts up even if no files were specified.
autocmd vimenter * if !argc() | NERDTree | endif
" Closes vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")

set background=dark
set encoding=utf8

" Puts all yanks, etc., into clipboard
set clipboard=unnamed

" Wraps lines longer than the width of the window
set wrap

" Maximum width of text; A longer line will be
"	 broken after white space to get this width.
set textwidth=80

let g:RightAlign_RightBorder=80

" Highlights the column after 'textwidth' column
set colorcolumn=+1 

" Syntax Higlighting
syntax on

" Highlight all matched pattern
set hlsearch
" Highlight matched pattern so far while still typing a search command 
set incsearch

" Automatically re-read an opened file when it has been modified externally. 
set autoread

" Removes all trailing whitespaces for stated filetypes before saving
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Ensure highlight group is not cleared by future colorscheme commands
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Highlights everything over column 80
highlight OverLength ctermbg=red ctermfg=white " guibg=#592929
autocmd BufWinEnter * match OverLength /\%81v.\+/

set guifont=Monospace\ 14
set tabstop=2
set backspace=2
set autoindent
set smartindent

" Shows what you are typing as a command at the bottom of the page
set showcmd
set cmdheight=2

" Change tab to a space character
set expandtab
set smarttab
set softtabstop=2
" Control how many columns text is indented with the reindent operations 
"   (<< and >>) and automatic C-style indentation.
set shiftwidth=2

" Changes the current working directory to the opened file or buffer. 
set autochdir

"" Case handling
set ignorecase
" Override the 'ignorecase' option if the search pattern contains upper
"  case characters. Used for the commands "/", "?", "n", "N",
"  ":g" and ":s".
set smartcase

" Ignores these file pattern matches
set wildignore=*.swp

" Show line number
set number
" Show the line and column number of the cursor position, separated by a comma.
set ruler

" Allows backspacing over everything in insert mode
set backspace=indent,eol,start

" Read/write a .viminfo file, don't store more than 50 lines of registers
set viminfo='20,\"50
" Keep up to 50 lines of command line history
set history=50



" Set font according to system
" For mac
set gfn=Menlo:h16
set shell=/bin/bash

" For windows
"set gfn=Bitstream\ Vera\ Sans\ Mono:h10

" For linux
"  set gfn=Monospace\ 10
"  set shell=/bin/bash

" Remaps jj to escape in insert mode"
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" Enable relativenumber by default
set relativenumber

" Toggles between absolute and relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

let mapleader=" "

" For easymotion plugin
let g:EasyMotion_leader_key = '<Leader>'

"Remove the toolbar in MacVim
set guioptions=egmrt

" Ignores trailing white space differences in vimdiff
set diffopt+=iwhite

" delete and paste instead of cut and copy/overwrite
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

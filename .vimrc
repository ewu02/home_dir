if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
set nocompatible	

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
filetype off
filetype plugin on
filetype indent on

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


"Remove the toolbar in MacVim
set guioptions=egmrt

  
" open a NERDTree automatically when vim starts up even if no files were specified.
autocmd vimenter * if !argc() | NERDTree | endif

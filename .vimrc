if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif
set nocompatible	

set background=dark
set encoding=utf8

" Puts all yanks, etc., into clipboard
set clipboard=unnamed

set wrap
set textwidth=80
let g:RightAlign_RightBorder=80
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Syntax Higlighting
filetype off
filetype plugin on
filetype indent on

" read a file when it is changed from the outside
set autoread


" Removes all trailing whitespaces for stated filetypes before saving
autocmd FileType c,cpp,java,php,ruby autocmd BufWritePre <buffer> :%s/\s\+$//e

" Make the omnicomplete text readable
highlight PmenuSel ctermfg=black

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
" For dark background.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/

set makeprg=./compile 
set guifont=Monospace\ 14
set tabstop=2
set backspace=2
set autoindent
set smartindent

" This shows what you are typing as a command at the bottom of the page
set showcmd
set cmdheight=2

" Change tab to a space character
set expandtab
set smarttab
set softtabstop=2
" control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation.
set shiftwidth=2

set autochdir

" Case handling
set ignorecase
set smartcase

" Spell checking (default=false)
if version >= 700
  set spl=en spell
  set nospell
endif

" For linux clipboard register
let g:clipbrdDefaultReg = '+'

set number
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Highlight tabs
syntax match Tab /\t/
hi Tab gui=underline guifg=blue ctermbg=blue

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


" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
   " Incremental search
   set incsearch
   set hlsearch
   set nolazyredraw
   "Remove the toolbar in MacVim
   set guioptions=egmrt
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[3%dm
     set t_Sf=[3%dm
endif

highlight OverLength ctermbg=red ctermfg=white " guibg=#592929
match OverLength /\%81v.\+/

" open a NERDTree automatically when vim starts up even if no files were specified.
autocmd vimenter * if !argc() | NERDTree | endif

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
Plugin 'gmarik/vundle'

" original repos on github
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/MatchTagAlways'
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'elixir-lang/vim-elixir'
Plugin 'jordansissel/vim-ackmore'
Plugin 'kchmck/vim-coffee-script'
Plugin 'keith/swift.vim'
Plugin 'mileszs/ack.vim'
Plugin 'moll/vim-node'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'
Plugin 'wavded/vim-stylus'

" vim-scripts repos
"  e.g., Plugin 'L9'
Plugin 'copypath.vim'
Plugin 'matchit.zip'
" non github repos
"  e.g., Plugin 'git://git.wincent.com/command-t.git'

filetype plugin indent on     " required!
"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on
filetype indent on
filetype plugin on

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
set textwidth=120

let g:RightAlign_RightBorder=120

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

" Removes all trailing whitespaces before saving
autocmd BufWritePre * %s/\s\+$//e

" Ensure highlight group is not cleared by future colorscheme commands
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Highlights everything over column 120
highlight OverLength ctermbg=red ctermfg=white " guibg=#592929
autocmd BufWinEnter * match OverLength /\%81v.\+/

if has('gui_running')
  set guioptions-=T " No toolbar
  if has('gui_win32') " Windows
    set guifont=Bitstream\ Vera\ Sans\ Mono:h16
  else " Linux
    set gfn=Menlo:h16
    set shell=/bin/bash
  endif
end

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


" Remaps jj to escape in insert mode"
inoremap jj <Esc>

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

" Leader key
let mapleader=','

" For easymotion plugin
let g:EasyMotion_leader_key = '<Leader>'

" Ignores trailing white space differences in vimdiff
set diffopt+=iwhite

" Delete and paste instead of cut and copy/overwrite
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP

" Allows selection of whole words containing '-'
set isk+=-

" Enable indent guides at startup
autocmd VimEnter * IndentGuidesEnable

" For ctrlp: Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Ignores these file pattern matches
set wildignore+=*/tmp/*,*/log/**,*.so,*.swp,*.zip " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

" Shortcut to open .vimrc and source current file
nnoremap <leader>z :vsplit $MYVIMRC<cr>
nnoremap <leader>zz :source $MYVIMRC<cr>

" Defines normal highlight group colorscheme for vim-indent-guides
hi Normal guifg=White guibg=Black

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Fall back to Ack if Ag is not available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Convenient way to play a macro recorded to register q
nnoremap <Space> @q

" Sort words in line
vnoremap <F2> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Abbreviations (insert mode)
"  substitute an abbreviation when you type any non-keyword character after an abbreviation
" I.e., iabbrev adn and

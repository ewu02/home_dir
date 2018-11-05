if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" For Vundle"""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins in Github repos
Plugin 'Lokaltog/vim-easymotion'
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/MatchTagAlways'
Plugin 'airblade/vim-gitgutter'
Plugin 'alvan/vim-closetag'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'moll/vim-node'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-syntastic/syntastic'

" vim-scripts repos
Plugin 'copypath.vim'

" All Plugins must be added before the following lines
call vundle#end()            " required
filetype plugin indent on    " required
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

" Displays all possible match above the command line during tab complete
set wildmenu

" Closes vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary")

set encoding=utf8

" React.js
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.jsx,*.html.erb'

" vim-MatchTagAlways
let g:mta_filetypes = {
  \ 'html' : 1,
  \ 'xhtml' : 1,
  \ 'xml' : 1,
  \ 'jinja' : 1,
  \ 'javascript.jsx' : 1,
  \}

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

" For ctrlp:
let g:ctrlp_show_hidden = 1
" Ignore files in .gitignore
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

" Maps 'ag' to Ack, and search from root directory (containing .git)
"   Dependent on vim-fugitive plugin
cnoreabbrev ag Gcd <bar> Ack!

" Convenient way to play a macro recorded to register q
nnoremap <Space> @q

" Sort words in line
vnoremap <F2> d:execute 'normal i' . join(sort(split(getreg('"'))), ' ')<CR>

" Open the quickfix window after grep invocation
autocmd QuickFixCmdPost *grep* cwindow

" For lightline
set laststatus=2
let g:lightline = {
      \ 'component': {
      \   'filename': '%<%{LightlineFilename()}',
      \ },
      \ }

function! LightlineFilename() abort
  return expand('%:p') !=# '' ? expand('%:p') : '[No Name]'
endfunction

" Abbreviations (insert mode)
"  substitute an abbreviation when you type any non-keyword character after an abbreviation
" I.e., iabbrev adn and

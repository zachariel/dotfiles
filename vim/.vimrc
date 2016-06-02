" Author: Zachariel <zachariel@me.com>
" Based on Mark Nichols dotfile
" http://github.com/zanshin/dotfiles/vim/vimrc

" Forget compatibility with vi
set nocompatible

" setup Vundle to manage plugins
" turn filetype on so that we can turn it off without generating an exit code
" of 1 when quiting vim.
filetype on
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
"Plugin 'andeepravi/refactor-rails'
"Plugin 'bling/vim-airline'
Plugin 'bling/vim-airline'
" Plugin 'benmills/vimux'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'scrooloose/nerdtree'
Plugin 'kchmck/vim-coffee-script'
Plugin 'lilydjwg/colorizer'
Plugin 'rking/ag.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
call vundle#end()     " required

" if has('autocmd')
filetype plugin indent on    " enable plugins, detection and indenting
" endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null %

" time out mappings after 1 second and key codes after 1/2 second
set timeout timeoutlen=1000 ttimeoutlen=500

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

set laststatus=2    " always show the status line
set cmdheight=1     " status line height
set showcmd         " show the command
set noshowmode      " don't show the mode, vim-airline will do that for us
set autoindent
set smartindent
" set linespace=3
" set linebreak

set textwidth=0 wrapmargin=0
set nowrap
" set wrap
" set textwidth=79
set ruler
set list
set listchars=tab:▸\ ,eol:$,trail:~,nbsp:␣,extends:❯,precedes:❮
set showmatch       " show matching brackets
set mat=5           " Bracket blinking
"if exists("&relativenumber")
"  set relativenumber    " use relative line numbers
"endif
set number
set backspace=indent,eol,start
set mousehide
set foldenable
set history=1000
"set ffs=unix,mac,dos    " default file types

" Encoding
set termencoding=utf-8
set encoding=utf-8

"" Setup automatic text formatting/wrapping (previously: grn1 )
"set formatoptions=
"set formatoptions-=t              " don't autowrap text
"set formatoptions+=c              " do autowrap comments
"set formatoptions+=r              " automatically continue comments
"set formatoptions+=o              " automatically continue comments when hitting 'o' or 'O'
"set formatoptions+=q              " allow formating of comments with 'gq'
"set formatoptions+=n              " recognize numbered lists
"set formatoptions+=l              " don't break long lines that were already there

" disable arrow keys and make semi-snarky comment. Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" use <C>hjkl to switch between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Move line(s) up or down via C-j and C-k respectively 
" Normal mode
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==

set backup
set noswapfile

if has('persistent_undo')
  set undodir=~/.vim/tmp/undo//     " undo files
  if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
  endif
endif

set backupdir=~/.vim/tmp/backup// " backups
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), "p")
endif

set directory=~/.vim/tmp/swap     " swap files
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), "p")
endif

" Set the color scheme
" silent!
let g:solarized_termtrans = 1
"let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Folding setting
set foldmethod=indent " fold based on indent
set foldnestmax=10    " deepest fold is 10 levels
set nofoldenable      " don't fold by default
set foldlevel=1

" Set tab stuff
set tabstop=2       " 2 spaces for a tab
set shiftwidth=2    " 2 spaces for autoindenting
set softtabstop=2   " when <BS>, pretend a tab is removed even if spaces
set expandtab       " expand tabs to spaces (overloadable by file type)
set hlsearch

" Scrolling
"set scrolloff=5         " show context above/below cursor line
"set sidescrolloff=10    " number of cols from horizontal edge to  start scrolling
"set sidescroll=1        " number of cols to scroll at a time

"set clipboard=unnamed     " yank and paste with the system clipboard
set hidden

" show cursorline only in active window
if has("autocmd")
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter * set cursorline
endif

" Map escape to jj -- much faster to reach and type
imap jj <esc>

" vim-airline settings
"let g:airline_left_sep = '▶'
"let g:airline_left_sep = ''
let g:airline_left_sep = '»'
"let g:airline_right_sep = '◀'
"let g:airline_theme='dark'
let g:airline#extensions#tabline#ebabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

" CTags
set tags+=./.git/tags

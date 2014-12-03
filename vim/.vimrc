set nocompatible
filetype on
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'tpop/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'benmills/vimux'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
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
if has('autocmd')
  filetype plugin indent on    " enable plugins, detection and indenting
endif

if has('syntax') && !exists('g:syntax_on')
  syntax on
endif

set nu
set laststatus=2 		" always show the status line
set cmdheight=2    		" and use a two-line tall status line
set showcmd			" show the command
set noshowmode			" don't show the mode, vim-airline will do that for us
set autoindent
set smartindent
set linespace=3
set linebreak
set wrap
set textwidth=79
set ruler
set list
set listchars=tab:▸\ ,eol:$,trail:⋅,nbsp:␣,extends:❯,precedes:❮
set showmatch
set backspace=indent,eol,start
set mousehide
set foldenable
set history=1000
set ffs=unix,mac,dos

" Encoding
set termencoding=utf-8
set encoding=utf-8


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
set background=dark
silent! colorscheme landscape

colorscheme solarized

" Folding setting
set foldmethod=indent	" fold based on indent
set foldnestmax=10	" deepest fold is 10 levels
set nofoldenable	" don't fold by default
set foldlevel=1

" Set tab stuff
set tabstop=2 			" 2 spaces for a tab
set shiftwidth=2		" 2 spaces for autoindenting
set softtabstop=2		" when <BS>, pretend a tab is removed even if spaces
set expandtab			" expand tabs to spaces (overloadable by file type)


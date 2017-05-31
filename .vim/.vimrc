execute pathogen#infect()
set guifont=8x13bold
set number
syntax on
set clipboard=unnamedplus
"old style dir structure
let g:NERDTreeDirArrows=0
let g:session_autosave = 'no'
set cursorbind
set modeline
set hlsearch
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set guiheadroom=0
set background=dark
set ww+=<,>
:hi LineNr ctermfg=darkcyan ctermbg=black
"For EasyMotion
let mapleader = '\'
"For Tcomment
map <leader>c <c-_><c-_>
"let g:SuperTabMappingForward = '<alt>'

if !has("gui_running")
colorscheme slate
hi CursorColumn cterm=NONE ctermbg=cyan ctermfg=white guibg=grey guifg=white
endif

"set showcmd      " Show (partial) command in status line.
set showmatch     " Show matching brackets.
"set ignorecase      " Do case insensitive matching
"set smartcase    " Do smart case matching
"set incsearch    " Incremental search
"set autowrite    " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a      " Enable mouse usage (all modes)

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


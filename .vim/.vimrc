if has('gui_running')
  " mappings:
  "  <leader> + w          => easymotion;N
  "  Ctrl + f              => create/toggle folds;N
  "  cs + <?>              => change parentheses to;N
  "  cst + <?>             => change parentheses from complex parentheses;N
  "  ds + <?>              => delete parentheses;N
  "  <leader> + c          => comment selection;V
  "  Shift + s             => put seletion in parentheses;V
  "  :Msearch add <return> => add another search;N
  "  :Tab /<?>             => tabularize text by pattern;N
  "  <visual> :Tab/<?>     => tabularize text by pattern;V
  "  jj                    => as Esc

  " plugins
  call plug#begin('~/.vim/plugs')
  Plug 'majutsushi/tagbar'
  Plug 'yegappan/mru'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-ragtag'
  Plug 'xolox/vim-session'
  " - deps for xolox-vim-session
  Plug 'xolox/vim-misc'
  "
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree'
  Plug 'sirver/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'itchyny/lightline.vim'
  Plug 'bling/vim-bufferline'
  Plug 'easymotion/vim-easymotion'
  Plug 'vim-scripts/MultipleSearch'
  Plug 'tomtom/tcomment_vim'
  Plug 'Raimondi/delimitMate'
  Plug 'rickhowe/diffchar.vim'
  Plug 'godlygeek/tabular'
  Plug 'Yggdroot/indentLine'
  " - colors
  Plug 'tomasr/molokai'
  Plug 'sickill/vim-monokai'
  Plug 'vim-scripts/mayansmoke'
  Plug 'altercation/vim-colors-solarized'
  Plug 'chriskempson/vim-tomorrow-theme'
  Plug 'vim-scripts/summerfruit256.vim'
  Plug 'reedes/vim-colors-pencil'
  Plug 'vim-scripts/ironman.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'goatslacker/mango.vim'
  Plug 'croaker/mustang-vim'
  Plug 'morhetz/gruvbox'
  " - syntax
  Plug 'tomlion/vim-solidity'
  Plug 'digitaltoad/vim-pug'
  Plug 'briancollins/vim-jst'
  Plug 'pangloss/vim-javascript'
  " - beautifiers
  Plug 'maksimr/vim-jsbeautify'
  " - misc
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ctrlpvim/ctrlp.vim'
  " - linters
  Plug 'w0rp/ale'
  Plug 'maximbaz/lightline-ale'
  " - tags and code analyzers
  Plug 'ternjs/tern_for_vim'
  Plug 'ramitos/jsctags'
  " - unused
  "   TODO: clean or recap
  "Plug 'kshenoy/vim-signature'
  "Plug 'garbas/vim-snipmate'
  " - deps for vim-snipmate
  "Plug 'tomtom/tlib_vim'
  "Plug 'MarcWeber/vim-addon-mw-utils'
  "Plug 'mattn/vim-xxdcursor'
  call plug#end()

  " main
  syntax on
  set path+=~/repos/**
  set number
  set relativenumber
  set cursorline
  set clipboard=unnamed
  set modeline
  set hlsearch
  set expandtab
  set shiftwidth=2
  set tabstop=2
  set softtabstop=2
  set backspace=2
  set guiheadroom=0
  set guicursor=a:hor12-Cursor
  set formatoptions=croql
  set whichwrap+=<,>
  set showmatch " || MatchParen
  set autoindent
  set hidden
  set guifont=Monaco:h12
  set linespace=2
  set bg=dark
  set laststatus=2
  set list
  set listchars=tab:▸·,trail:·,eol:¬
  set guioptions+=menu
  set guioptions-=menu
  set guioptions-=T  " Removes top toolbar
  set guioptions-=r  " Removes right hand scroll bar
  set guioptions-=m  " Removes menu bar
  set go-=L          " Removes left hand scroll bar
  set directory=$HOME/.vim/.tmp
  set wildmenu
  set incsearch
  set wildmode=list:longest
  set showtabline=0
  set conceallevel=0
  set fillchars+=vert:\
  set wildignore+=*/node_modules/**
  autocmd BufEnter * silent! lcd %:p:h  " CWD to buffer's directory
  autocmd CompleteDone * pclose         " close preview windows after completion is done

  " import plugin and color schemes settings, key mappings
  " - mappings
  source $HOME/.vim/rc/maps
  " - colorschemes
  source $HOME/.vim/rc/colors
  " - NERDTree
  source $HOME/.vim/rc/nerdtree
  " - lightline
  source $HOME/.vim/rc/lightline
  " - session.vim
  source $HOME/.vim/rc/session
  " - MRU
  source $HOME/.vim/rc/mru
  " - indentLine
  source $HOME/.vim/rc/indentline
  " - ale
  source $HOME/.vim/rc/ale
  " - tagbar
  source $HOME/.vim/rc/tagbar
  " - ctrlp
  source $HOME/.vim/rc/ctrlp
  " - filetype specific
  source $HOME/.vim/rc/ft

else
  " plain VIM
  colo slate
  syntax on
  set nu
  set relativenumber
  set incsearch
  set hlsearch
  set modeline
  set bs=2
endif

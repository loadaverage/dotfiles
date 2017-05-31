" Some mappings:
"  \\ + w    => easymotion;N
"  Ctrl + f  => create/toggle folds;N
"  cs + <?>  => change parentheses to;N
"  cst + <?> => change parentheses from complex parentheses;N
"  ds + <?>  => delete parentheses;N
"  \ + c     => comment selection;V
"  Shift + s => put seletion in parentheses;V
"  :Msearch add <return> => add another search;N
"  :Tab /<?>              => tabularize text by pattern;N
"  <visual> :Tab/<?>      => tabularize text by pattern;V
"  jj        => instead Esc key
"

" main
set nu
set cursorline
set expandtab
set relativenumber
set guicursor=a:hor12-Cursor
set hidden
set tabstop=2
set guifont=Sauce\ Code\ Powerline
set bg=light
set laststatus=2
set list
set listchars=tab:▸·,trail:·,eol:¬
set guioptions+=menu
set guioptions-=menu
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="wombat"
let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=m " Removes menu bar
set go-=L " Removes left hand scroll bar
"set autocomplete as menu
set wildmenu
set wildmode=list:longest
" jump to search
set incsearch
"for indentation stuff
set shiftwidth=2
let g:indent_guides_start_level=2
map <F4> :IndentGuidesToggle <CR>
"jj as Esc
inoremap jj <ESC>
"monokai stuff start
""let g:molokai_original = 1
colorscheme pencil
set bg=dark
hi vertsplit guifg=fg guibg=bg
set fillchars+=vert:\ 
"make cursorline more readable in diffmode
if &diff
   hi CursorLine gui=underline guibg=NONE
   hi DiffDelete gui=NONE guifg=bg guibg=#181818
   hi DiffAdd gui=NONE guifg=bg guibg=#10A778
   hi DiffText gui=NONE guifg=bg guibg=#D75F5F
endif
"monokai stuff end
" tabs navigation
"split navi
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"create fold Ctrl + f
vmap <C-f> zf
"toggle fold
nmap <C-f> za

"Buffers
"prev
map <C-p> :bp<CR>
"next
map <C-n> :bn<CR>

"newtab
map <C-t> :tabnew<CR>
"undo
map <C-z> :u<CR>
"redo
map <C-y> :redo<CR>
"save
map <C-s> :w<CR>
"close
nmap <A-s> :q<CR>

" text buffer
"select all
nmap <C-A> ggVG
"CTRL-C to copy (visual mode)
vmap <C-c> y
"CTRL-X to cut (visual mode)
vmap <C-x> x
"CTRL-V to paste (insert mode)
imap <C-v> <esc>P
"CTRL+V to paste from other clipboard
nmap <C-V> "+gP
"And copy
vmap <C-C> "+y
"And cut
vmap <C-X> "+x
"Paste in selected from X clipboard
vmap <C-v> "+p

" numbers
"Increasing numbers by Ctrl+c instead Crtl+a
nnoremap <C-c> <C-a>

" helpful stuff
"NERD tree
map <F2> :NERDTreeToggle<CR>
"Colorizer
map <F3> :ColorHighlight<CR>
"Complete tags
imap  <C-s> <C-X>/
"diff two buffers
nmap <A-d> :windo diffoff <CR> :windo diffthis <CR>
"split wordlist into one column
nmap rn :%s/\n//g <CR> :%s/ \{1,}/\r/g <CR>

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

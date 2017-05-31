"new
set guifont=Sauce\ Code\ Powerline
set bg=dark
set laststatus=2
set list
set listchars=tab:▸·,trail:·,eol:¬
let g:airline_powerline_fonts=1
"new
colorscheme gruvbox
":set gfn=DeJavu\ \Sans\ Mono\ 10
set nu
"color codeschool
let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=m " Removes menu bar
set go-=L " Removes left hand scroll bar
"autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
":set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

" CTRL-C to copy (visual mode)
vmap <C-c> y

" CTRL-X to cut (visual mode)
vmap <C-x> x

" CTRL-V to paste (insert mode)
imap <C-v> <esc>P




" CTRL+V to paste from other clipboard

nmap <C-V> "+gP

" And copy

vmap <C-C> "+y 

"And cut
vmap <C-X> "+x


" Select All

nmap <C-A> ggVG


" NERD tree
map <F2> :NERDTreeToggle<CR>

" Paste in selected from X clipboard
vmap <C-v> "+p

"Colorizer
map <F3> :ColorHighlight<CR>

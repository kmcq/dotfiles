""" Leader
let mapleader = " "

"""""""""""""""""""""

""" Basics
set noswapfile

"""""""""""""""""""""

""" Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-vinegar'

call plug#end()

"""""""""""""""""""""

""" Window management

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

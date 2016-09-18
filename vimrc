""" Leader
let mapleader = " "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Basics

set autowrite                         " :write before running commands
set clipboard=unnamed                 " Use system clipboard
set diffopt+=vertical                 " Always use vertical diffs
set expandtab                         " Tab in insert mode will be spaces
set ignorecase                        " When searching don't worry if lowercase
set incsearch                         " do incremental searching
set nocompatible                      " Don't worry about vi compatibility
set noswapfile                        " No weird .swp fields
set number                            " Show line numbers
set ruler                             " show the cursor position all the time
set shiftwidth=2                      " >> and << commands shift 2 spaces
set smartcase                         " Strict search case when includes upper
set tabstop=2                         " Softtabs, 2 spaces
set textwidth=80                      " Wrap lines at 80 characters
set wildmode=list:longest,list:full   " Show completion options

syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'                       " Show git changed lines
Plug 'terryma/vim-multiple-cursors'                 " Sublime-like mutli-cursor
Plug 'tpope/vim-eunuch'                             " Nice UNIX commands
Plug 'tpope/vim-fugitive'                           " Vim-Git bindings
Plug 'tpope/vim-rails'                              " Vim-Rails bindings
Plug 'tpope/vim-vinegar'                            " Better netrw
Plug 'vim-ruby/vim-ruby'                            " Vim-Ruby integration
Plug 'vim-scripts/tComment'                         " Comment out lines
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim' " Fuzzy finder

call plug#end()

filetype plugin indent on

" FZF settings
nnoremap <C-T> :GFiles<CR>
nnoremap <C-B> :Buffers<CR>
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible

" Multi-cursor set to CTRL+N
let g:multi_cursor_next_key='<C-n>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Window management

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Shortcuts

" Binding pry shortcut
map <Leader>bro orequire'pry';binding.pry<esc>:w<cr>

" Easy current filepath
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Switch between the last two files
nnoremap <leader><leader> <c-^>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Alter Vim's behavior

" Persistent undo history
if exists("+undofile")
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif

  set undofile
  set undodir=~/.vim/undo/
endif

" Don't copy the contents of an overwritten selection.
vnoremap p "_dP

" Traverse lines as they are seen not as as they are known to Vim
nnoremap j gj
nnoremap k gk

" No arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

call plug#begin('~/.vim/plugged')

" Addons
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/splitjoin.vim'                    " Toggle between multi- and single-line expressions
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'lewis6991/gitsigns.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript']}
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
" Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-markdown'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" File system navigation
Plug 'tpope/vim-eunuch'

" Syntax errors
Plug 'ntpeters/vim-better-whitespace'

" Markdown support
Plug 'junegunn/goyo.vim'

" Git support
Plug 'tpope/vim-rhubarb' | Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" ctags
Plug 'ludovicchabant/vim-gutentags'

" Testing
Plug 'janko-m/vim-test'
Plug 'bswinnerton/vim-test-github'

Plug 'chrisbra/Colorizer'
Plug 'projekt0n/github-nvim-theme'

" Gist
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

Plug 'github/copilot.vim'

call plug#end()

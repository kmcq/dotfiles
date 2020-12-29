call plug#begin('~/.vim/plugged')

" Addons
" Plug 'bswinnerton/vim-base16-lightline'
" Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/splitjoin.vim'                    " Toggle between multi- and single-line expressions
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'

" Tmux integration
" Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" File system navigation
Plug 'tpope/vim-eunuch'

" Syntax highlighting
" Plug 'dag/vim-fish'
" Plug 'groenewege/vim-less'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript']}
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-endwise'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'zerowidth/vim-copy-as-rtf'

" Syntax errors
Plug 'w0rp/ale'
Plug 'ntpeters/vim-better-whitespace'

" Markdown support
Plug 'junegunn/goyo.vim'

" Git support
Plug 'tpope/vim-rhubarb' | Plug 'tpope/vim-fugitive'

" ctags
Plug 'ludovicchabant/vim-gutentags'

" Themes
" Plug 'chriskempson/base16-vim'

" Testing
Plug 'janko-m/vim-test'
Plug 'bswinnerton/vim-test-github'

" Display hex colors
Plug 'chrisbra/Colorizer'

" Gist
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'

call plug#end()

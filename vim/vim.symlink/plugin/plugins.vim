call plug#begin('~/.vim/plugged')

" Addons
" Plug 'bswinnerton/vim-base16-lightline'
" Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'AndrewRadev/splitjoin.vim'                    " Toggle between multi- and single-line expressions
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Syntax highlighting and language support
if has('nvim')
  function! InstallTreesitterLanguages(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
      TSInstall json yaml go ruby tsx typescript
      TSUpdate
    endif
  endfunction

  Plug 'nvim-lua/plenary.nvim'
  Plug 'lewis6991/gitsigns.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': function('InstallTreesitterLanguages') }
  Plug 'jparise/vim-graphql' " nvim-treesitter graphql doesn't work

  Plug 'hrsh7th/nvim-compe'
  Plug 'neovim/nvim-lspconfig'
  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils', { 'branch': 'develop' }
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-lua/plenary.nvim'

else

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript']}
  Plug 'fatih/vim-go'
  Plug 'jparise/vim-graphql'
  Plug 'sheerun/vim-polyglot'
  " Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'w0rp/ale'
  Plug 'airblade/vim-gitgutter'
endif

Plug 'tpope/vim-markdown'

" Tmux integration
" Plug 'benmills/vimux'
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

call plug#end()

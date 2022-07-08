call plug#begin('~/.vim/plugged')

" Editor
Plug 'feline-nvim/feline.nvim'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nvim-lua/plenary.nvim'
Plug 'ojroques/vim-oscyank'
Plug 'projekt0n/github-nvim-theme'
Plug 'scrooloose/nerdtree'

" Commands
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb' | Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

" Language Support
Plug 'fatih/vim-go'
Plug 'jparise/vim-graphql'
Plug 'lukas-reineke/lsp-format.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Misc
Plug 'christoomey/vim-tmux-navigator' " Tmux integration
Plug 'pwntester/octo.nvim'
Plug 'nvim-telescope/telescope.nvim' " required by octo.nvim
Plug 'kyazdani42/nvim-web-devicons' " required by octo.nvim

call plug#end()

require("options")
require("remaps")

-- Install packer if it isn't installed
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local bootstrap_packer = false

if fn.empty(fn.glob(install_path)) > 0 then
  bootstrap_packer = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })

  -- Add the directory where we just installed packer to the runtimepath so
  -- that it is taken into account. Otherwise it is going to be ignored and
  -- require("packer") won't work.
  vim.o.runtimepath = vim.fn.stdpath("data") .. "/site/pack/*/start/*," .. vim.o.runtimepath
end

local ok, impatient = pcall(require, "impatient")
if not ok then
  print("Not loading impatient")
end

local packer = require("packer")
local plugins = function(use)
  use("wbthomason/packer.nvim")
  use("lewis6991/impatient.nvim")

  -- Editor
  use({
    "feline-nvim/feline.nvim",
    config = function()
      require("feline").setup()
    end,
  })
  use("github/copilot.vim")
  use({
    "junegunn/fzf",
    run = "fzf#install()",
    config = function()
      require("conf-fzf")
    end,
  })
  use("junegunn/fzf.vim")
  use({
    "junegunn/goyo.vim",
    config = function()
      require("conf-goyo")
    end,
  })
  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("conf-gitsigns")
    end,
  })
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup()
    end,
  })
  use({
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.api.nvim_exec(
        [[
          autocmd BufWritePre * StripWhitespace
        ]],
        false
      )
    end,
  })
  use({
    "ojroques/vim-oscyank",
    config = function()
      require("conf-oscyank")
    end,
  })
  use({
    "projekt0n/github-nvim-theme",
    config = function()
      require("github-theme").setup({
        theme_style = "dark",
      })
    end,
  })
  use({
    "scrooloose/nerdtree",
    config = function()
      require("conf-nerdtree")
    end,
  })

  -- Commands
  use("AndrewRadev/splitjoin.vim")
  use("tpope/vim-commentary")
  use("tpope/vim-eunuch")
  use({
    "tpope/vim-fugitive",
    requires = {
      "tpope/vim-git",
      "tpope/vim-rhubarb",
      { "junegunn/gv.vim", cmd = { "GV", "GV!" } },
    },
    config = function()
      -- require("conf-git")
    end,
  })
  use("tpope/vim-surround")

  -- Language Support
  use("fatih/vim-go")
  use("jparise/vim-graphql")
  use({
    "nvim-treesitter/nvim-treesitter",
    requires = "nvim-treesitter/nvim-treesitter-textobjects",
    run = ":TSUpdate",
    config = function()
      require("conf-treesitter")
    end,
  })
  use({
    "neovim/nvim-lspconfig",
    requires = {
      "folke/trouble.nvim",
      "jose-elias-alvarez/null-ls.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "lukas-reineke/lsp-format.nvim",
      "williamboman/nvim-lsp-installer",
    },
    config = function()
      require("conf-lspconfig")
    end,
  })
  use("tpope/vim-rails")
  use("vim-ruby/vim-ruby")

  -- Misc
  use("christoomey/vim-tmux-navigator")
  use({
    "pwntester/octo.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "kyazdani42/nvim-web-devicons",
    },
    cmd = { "Octo" },
    config = function()
      require("octo").setup()
    end,
  })

  if bootstrap_packer then
    packer.sync()
  end
end

local config = {
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
}

packer.startup({ plugins, config = config })

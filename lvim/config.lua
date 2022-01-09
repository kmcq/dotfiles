-- TODO Things to change
--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- - K for search current word (use telescope though?)

-- general
lvim.format_on_save = true
lvim.lint_on_save = true

-- keymappings [view all by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.normal_mode["-"] = "<cmd>:NERDTreeFind<cr>"
lvim.keys.normal_mode["<C-s>"] = "<cmd>w<cr>"
lvim.keys.normal_mode["<C-b>"] = "<cmd>lua require('telescope.builtin').buffers({ sort_lastused = true, ignore_current_buffer = true })<cr>"
lvim.keys.normal_mode["<C-t>"] = "<cmd>Telescope git_files<cr>"
lvim.keys.normal_mode["\\"] = "<cmd>Telescope live_grep<cr>"
lvim.keys.normal_mode["]c"] = "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
lvim.keys.normal_mode["[c"] = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
lvim.keys.normal_mode["<A-j>"] = "j"
lvim.keys.normal_mode["<A-k>"] = "k"
lvim.keys.normal_mode["j"] = "gj"
lvim.keys.normal_mode["k"] = "gk"
lvim.keys.normal_mode["<leader><leader>"] = "<c-^>"

-- Just place your caret on a word, hit c* and type, hit <esc> and then hit .
-- as many time as you want to repeat
lvim.keys.normal_mode["c*"] = "*Ncgn"
lvim.keys.normal_mode["c#"] = "#NcgN"
lvim.keys.normal_mode["d*"] = "*Ndgn"
lvim.keys.normal_mode["d#"] = "#NdgN"

lvim.keys.normal_mode["<leader>bro"] = "orequire'pry';binding.pry<esc>:w<cr>"
vim.api.nvim_set_keymap('c', '%%', "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true, noremap = true })

-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>lua require'telescope'.extensions.project.project{}<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.notify.active = true
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = false
lvim.builtin.bufferline.active = false

-- makes which-key take a long time to show up
vim.opt.timeoutlen = 5000

-- vim.opt.breakindent
-- setlocal breakindentopt=min:6,list:-1
-- let &l:formatlistpat = '^\s*\d\+\.\s\+\|^\s*[-*+>]\s\+\|^\[^\ze[^\]]\+\]:'

lvim.builtin.telescope.defaults.layout_config.width = 0.95

lvim.builtin.nvimtree.active = false
-- lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
-- lvim.builtin.nvimtree.width = 50

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup.root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules")
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { exe = "black", filetypes = { "python" } },
--   { exe = "isort", filetypes = { "python" } },
--   {
--     exe = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--print-with", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }

-- -- set additional linters
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { exe = "flake8", filetypes = { "python" } },
--   {
--     exe = "shellcheck",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     args = { "--severity", "warning" },
--   },
--   {
--     exe = "codespell",
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "javascript", "python" },
--   },
-- }

-- Additional Plugins
lvim.plugins = {
    {
        "projekt0n/github-nvim-theme",
        config = function()
            require("github-theme").setup({
                theme_style = "dark",
            })
        end,
    },
    {
        "tpope/vim-fugitive",
        cmd = {
            "G",
            "Git",
            "Gdiffsplit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "GMove",
            "GDelete",
            "GBrowse",
            "GRemove",
            "GRename",
            "Glgrep",
            "Gedit"
        },
        ft = {"fugitive"}
    },
    {"tpope/vim-rhubarb"},
    {"preservim/nerdtree"},
    {"github/copilot.vim"},
    {"junegunn/goyo.vim"},
    {"tpope/vim-eunuch"},
    {
        "pwntester/octo.nvim",
        config = function()
          require"octo".setup()
        end,
    },
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
    { "BufWinEnter", "*.lua", "setlocal ts=4 sw=4" },
}

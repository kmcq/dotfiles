-- TODO Things to change
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
lvim.keys.normal_mode["[c"] = "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
lvim.keys.normal_mode["]c"] = "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
lvim.keys.normal_mode["<A-j>"] = "j"
lvim.keys.normal_mode["<A-k>"] = "k"
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
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = false
lvim.builtin.bufferline.active = false

-- makes which-key take a long time to show up
vim.opt.timeoutlen = 5000

lvim.builtin.telescope.defaults.layout_config.width = 0.95

lvim.builtin.nvimtree.active = false
-- lvim.builtin.nvimtree.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
-- lvim.builtin.nvimtree.width = 50

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = { "json", "yaml", "go", "ruby", "tsx", "typescript" }
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--     args = {}
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--     args = {}
--   }
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
}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
    { "BufWinEnter", "*.lua", "setlocal ts=4 sw=4" },
}

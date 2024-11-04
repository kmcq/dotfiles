-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Opts to set before plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.root_spec = { ".git" }

vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.o.expandtab = true
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
vim.opt.foldlevel = 99
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.ignorecase = true -- Ignore case
vim.opt.inccommand = "nosplit" -- preview incremental substitute
vim.opt.jumpoptions = "view"
vim.opt.laststatus = 3 -- global statusline
vim.opt.linebreak = true -- Wrap lines at convenient points
vim.opt.list = true -- Show some invisible characters (tabs...
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.hlsearch = false -- don't highlight searches
vim.opt.number = true -- Print line number
vim.opt.pumblend = 10 -- Popup blend
vim.opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.shiftround = true -- Round indent
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.showmode = false -- Dont show mode since we have a statusline
vim.opt.sidescrolloff = 8 -- Columns of context
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.spelllang = { "en" }
vim.opt.spelloptions:append("noplainbuffer")
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitkeep = "screen"
vim.opt.splitright = true -- Put new windows right of current
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- True color support
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.updatetime = 200 -- Save swap file and trigger CursorHold
vim.opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode
vim.opt.winminwidth = 5 -- Minimum window width
vim.opt.wrap = true

vim.diagnostic.config({
	virtual_text = false,
})

vim.keymap.set("n", "c*", "*Ncgn")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<c-k>", "<c-w>k")

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("auto_create_dir", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Things to do after saving a file
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	group = vim.api.nvim_create_augroup("buf_write_post", { clear = true }),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		vim.cmd([[Trouble diagnostics toggle]])
	end,
})

-- Setup plugins
require("lazy").setup({
	spec = {
		{
			"saghen/blink.cmp",
			lazy = false, -- lazy loading handled internally
			version = "v0.*", -- use a release tag to download pre-built binaries
			opts = {
				keymap = { preset = "super-tab" },

				highlight = {
					use_nvim_cmp_as_default = true,
				},
				nerd_font_variant = "mono",
			},
		},
		{
			"MagicDuck/grug-far.nvim",
			opts = { headerMaxWidth = 80 },
			keys = {
				{
					"\\",
					function()
						local grug = require("grug-far")
						local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
						grug.open({
							transient = true,
							prefills = {
								filesFilter = ext and ext ~= "" and "*." .. ext or nil,
							},
						})
					end,
					mode = { "n", "v" },
					desc = "Search and Replace",
				},
			},
			config = function()
				require("grug-far").setup()
			end,
		},
		{
			"folke/trouble.nvim",
			cmd = { "Trouble" },
			opts = {
				auto_preview = false,
				warn_no_results = false,
				modes = {
					diagnostics = {
						filter = { buf = 0 }, -- filter diagnostics to the current buffer
					},
					lsp = {
						win = { position = "bottom" },
					},
					symbols = {
						win = { position = "bottom" },
					},
				},
			},
			keys = {
				{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
				{ "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
				{
					"<leader>cc",
					"<cmd>Trouble lsp toggle<cr>",
					desc = "LSP references/definitions/... (Trouble)",
				},
				{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			},
		},
		{
			"nvim-lualine/lualine.nvim",
			opts = function()
				local trouble = require("trouble")
				trouble.statusline({
					mode = "lsp_document_symbols",
					groups = {},
					title = false,
					filter = { range = true },
					format = "{kind_icon}{symbol.name:Normal}",
					-- The following line is needed to fix the background color
					-- Set it to the lualine section you want to use
					hl_group = "lualine_c_normal",
				})
			end,
		},
		{
			"ibhagwan/fzf-lua",
			-- optional for icon support
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				-- calling `setup` is optional for customization
				require("fzf-lua").setup({})
				vim.keymap.set("n", "<c-T>", require("fzf-lua").git_files, { desc = "Fzf Files" })
			end,
		},
		{ "tpope/vim-fugitive" },
		{ "tpope/vim-rhubarb" },
		{ "tpope/vim-vinegar" },
		{
			"projekt0n/github-nvim-theme",
			lazy = false,
			priority = 1000,
			config = function()
				-- load the colorscheme here
				vim.cmd([[colorscheme github_dark_high_contrast]])
			end,
		},
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("gitsigns").setup({
					on_attach = function(bufnr)
						local gitsigns = require("gitsigns")

						local function map(mode, l, r, opts)
							opts = opts or {}
							opts.buffer = bufnr
							vim.keymap.set(mode, l, r, opts)
						end

						-- Navigation
						map("n", "]c", function()
							if vim.wo.diff then
								vim.cmd.normal({ "]c", bang = true })
							else
								gitsigns.nav_hunk("next")
							end
						end)

						map("n", "[c", function()
							if vim.wo.diff then
								vim.cmd.normal({ "[c", bang = true })
							else
								gitsigns.nav_hunk("prev")
							end
						end)

						-- Actions
						map("n", "<leader>hs", gitsigns.stage_hunk)
						map("v", "<leader>hs", function()
							gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end)
						map("n", "<leader>hr", gitsigns.reset_hunk)
						map("v", "<leader>hr", function()
							gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
						end)
						map("n", "<leader>hS", gitsigns.stage_buffer)
						map("n", "<leader>hR", gitsigns.reset_buffer)
						map("n", "<leader>hu", gitsigns.undo_stage_hunk)
						map("n", "<leader>hp", gitsigns.preview_hunk)
						map("n", "<leader>hb", function()
							gitsigns.blame_line({ full = true })
						end)
						map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
						map("n", "<leader>hd", gitsigns.diffthis)
						map("n", "<leader>hD", function()
							gitsigns.diffthis("~")
						end)
						map("n", "<leader>td", gitsigns.toggle_deleted)
						map("n", "<leader>gl", ":Git log %<CR>")

						-- Text object
						map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
					end,
				})
			end,
		},
		{
			"stevearc/conform.nvim",
			opts = {
				formatters_by_ft = {
					lua = { "stylua" },
					javascript = { "prettier" },
				},
			},
			keys = {
				{
					"<leader>cf",
					function()
						require("conform").format({ timeout_ms = 3000 })
					end,
					desc = "Format file",
				},
			},
		},
		{
			"neovim/nvim-lspconfig",
			opts = {
				diagnostics = {
					virtual_text = false,
					float = { border = "rounded" },
				},
			},
			dependencies = {
				"mason.nvim",
				{ "williamboman/mason-lspconfig.nvim", config = function() end },
			},
			config = function()
				-- Ensure mason can use asdf-installed packages
				vim.fn.setenv("PATH", vim.fn.expand("~/.asdf/shims:$PATH"))

				require("mason").setup()
				require("mason-lspconfig").setup()

				local capabilities = vim.lsp.protocol.make_client_capabilities()
				local mason_lspconfig = require("mason-lspconfig")
				local servers = {
					omnisharp = {},
					lua_ls = {
						Lua = {
							diagnostics = {
								-- Get the language server to recognize some globals
								globals = { "hs", "vim" },
							},
						},
					},
					ruby_lsp = {},
					ts_ls = {},
				}

				mason_lspconfig.setup({
					ensure_installed = vim.tbl_keys(servers),
				})

				mason_lspconfig.setup_handlers({
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = capabilities,
							settings = servers[server_name],
							filetypes = (servers[server_name] or {}).filetypes,
						})
					end,
				})
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			version = false, -- last release is way too old
			build = ":TSUpdate",
			lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
			init = function(plugin)
				-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
				-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
				-- no longer trigger the **nvim-treesitter** module to be loaded in time.
				-- Luckily, the only things that those plugins need are the custom queries, which we make available
				-- during startup.
				require("lazy.core.loader").add_to_rtp(plugin)
				require("nvim-treesitter.query_predicates")
			end,
			cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
			opts_extend = { "ensure_installed" },
			opts = {
				highlight = { enable = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"c",
					"diff",
					"html",
					"javascript",
					"jsdoc",
					"json",
					"jsonc",
					"lua",
					"luadoc",
					"luap",
					"markdown",
					"markdown_inline",
					"printf",
					"python",
					"query",
					"regex",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"yaml",
				},
			},
			config = function(_, opts)
				require("nvim-treesitter.configs").setup(opts)
			end,
		},
	},
	install = { colorscheme = { "github_dark_high_contrast" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

-- Leader - override the default
vim.g.mapleader = ' '

local undodir = vim.env.HOME .. "/.nvim-undo/"

local options = {
  clipboard = "unnamed", -- Use system clipboard

  number = true, -- Enable line numbers

  autoread = true, -- Auto reload changed files
  autowrite = true, -- :write before running commands

  undofile = true,
  undodir = undodir,

  -- http://vi.stackexchange.com/a/2163
  backspace = "indent,eol,start",
  completeopt = "menuone,noselect",

  -- Split below and to the right
  splitbelow = true,
  splitright = true,

  autoindent = true, -- auto indent
  expandtab = true, -- spaces for tabs
  shiftwidth = 2, -- 2 spaces for tab
  tabstop = 2, -- 2 spaces for tab
  softtabstop = 2, -- 2 spaces for tab
  wrap = true, -- wrap lines

  gdefault = true, -- Default to substituting all matches

  -- Fold settings
  foldmethod = "indent",
  foldlevelstart = 99,

  ignorecase = true, -- Search queries intelligently set case
  smartcase = true, -- Search queries intelligently set case
  incsearch = true, -- Show search results as you type
  infercase = true, -- Ignore case on insert completion
  laststatus = 2, -- Show status line on startup
  lazyredraw = true, -- Reduce the redraw frequency
  hlsearch = false, -- Don't leave search results highlighted

  showcmd = true, -- Show size of visual selection

  showfulltag = true, -- Show extra information when using tags in insert mode

  -- Remove timeout when hitting escape
  timeoutlen = 1000,
  ttimeoutlen = 0,

  ttyfast = true, -- Send more characters in fast terminals

  scrolloff = 5, -- Leave 5 lines of buffer when scrolling
  sidescrolloff = 10, -- Leave 10 characters of horizontal buffer when scrolling

  wildmenu = true, -- Tab autocomplete in command mode
}

for key, val in pairs(options) do
  vim.o[key] = val
end

-- Always use vertical diffs
vim.opt.diffopt = vim.opt.diffopt + "vertical"

-- Also match angle brackets
vim.opt.matchpairs = vim.opt.matchpairs + "<:>"

-- Ignored files/directories from autocomplete (and CtrlP)
local autocomplete_ignore = {
  "*.so",
  "*.zip",
  "*/node_modules/",
  "*/tmp/*",
  "*/vendor/bundle/*",
}

for _, file in ipairs(autocomplete_ignore) do
  vim.opt.wildignore = vim.opt.wildignore + file
end

vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'ruby', 'json'}

-- Spellcheck
vim.api.nvim_exec(
  [[
    augroup setSpelling
      autocmd!

      autocmd FileType gitcommit setlocal spell spelllang=en_us
      autocmd FileType markdown setlocal spell spelllang=en_us
    augroup END
  ]],
  false
)

-- Ensure undodir exists
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p")
end

-- if vim.env.CODESPACES then
--   vim.g.clipboard = {
--     name = "rdm",
--     copy = {
--       ["+"] = { "rdm", "copy" },
--       ["*"] = { "rdm", "copy" }
--     },
--     paste = {
--       ["+"] = { "rdm", "paste" },
--       ["*"] = { "rdm", "paste" }
--     },
--   }
-- end

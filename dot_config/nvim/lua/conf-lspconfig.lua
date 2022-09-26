require("lsp-format").setup()
require("mason").setup()
require("trouble").setup({})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.rubocop,
    null_ls.builtins.code_actions.gitsigns
  },
})

-- Disable inline diagnostics.
vim.diagnostic.config({
  virtual_text = false,
})

-- Add a border to hovers to make them easier to read.
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local ts_utils = require('nvim-lsp-ts-utils')
ts_utils.setup({})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  ts_utils.setup_client(client)

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev({ float = { border = 'rounded' } }) end, opts)
  vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next({ float = { border = 'rounded' } }) end, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', '<space>e', function() vim.diagnostic.open_float(nil, { border = 'rounded' }) end, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', '<space>s', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<space>rr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, opts)
  -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
  -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
  -- vim.keymap.set('n', '<space>wl', print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)

  -- Add formatter
  require "lsp-format".on_attach(client)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "eslint", "gopls", "graphql", "sumneko_lua", "tsserver" }
require("mason-lspconfig").setup({
  ensure_installed = servers
})
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
  }
end

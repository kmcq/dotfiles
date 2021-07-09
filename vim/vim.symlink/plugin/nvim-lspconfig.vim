if has('nvim')
lua <<EOF
require'lspconfig'.tsserver.setup{
  on_attach = function(client, bufnr)
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup_client(client)
  end
}
EOF
endif

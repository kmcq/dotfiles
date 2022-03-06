" if has('nvim')
"   nnoremap <silent>gh :Lspsaga hover_doc<CR>
"   nnoremap <silent>gs :Lspsaga signature_help<CR>
"   nnoremap <silent> <leader>gh :Lspsaga show_line_diagnostics<CR>
"   nnoremap <silent> [e :Lspsaga diagnostic_jump_prev<CR>
"   nnoremap <silent> ]e :Lspsaga diagnostic_jump_next<CR>
" lua <<EOF
"   local saga = require 'lspsaga'
"   saga.init_lsp_saga()
" EOF
" endif

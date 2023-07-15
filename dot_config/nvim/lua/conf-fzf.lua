vim.keymap.set("n", "<C-T>", ":Files<CR>")
vim.keymap.set("n", "<C-B>", ":Buffers<CR>")
vim.keymap.set("n", "<C-Y>", ":History<CR>")

-- Make jump to tag open up FZF
vim.keymap.set("n", "<c-]>", ":Tags <c-r><c-w><cr>")

vim.keymap.set("n", "\\", ":Ag<space>")
vim.keymap.set("n", "K", ":Ag <C-R><C-W><CR>")

vim.g.fzf_buffers_jump = 1 -- [Buffers] Jump to the existing window if possible
vim.g.fzf_preview_window = { "up:40%", "ctrl-\\", } -- ctrl-\\ toggles preview
vim.g.fzf_layout = { window = { width = 0.8, height = 0.9, yoffset = 0.2 } }
vim.api.nvim_exec(
  [[
    " Replace the default dictionary completion with fzf-based fuzzy completion
    inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
    inoremap <expr> <c-g><c-g> fzf#vim#complete('git coauthors')
  ]],
  false
)

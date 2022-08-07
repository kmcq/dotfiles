vim.api.nvim_exec(
  [[
    autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankReg "' | endif
  ]],
  false
)
vim.g.oscyank_term = 'tmux'

-- Don't copy the contents of an overwritten selection.
vim.keymap.set("v", "p", "\"_dP")
vim.keymap.set("v", "P", "\"_dP")

vim.keymap.set("x", "<C-K>", ":move-2<cr>gv")
vim.keymap.set("x", "<C-J>", ":move'>+<cr>gv")
vim.keymap.set("x", "<C-H>", "<gv")
vim.keymap.set("x", "<C-L>", ">gv")
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- Shortcut for <CTRL> + hjkl to traverse panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Bash like keys for the Vim command line
vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("c", "<C-E>", "<End>")
vim.keymap.set("c", "<C-K>", "<C-U>")

-- Remap j and k to act as expected when used on long, wrapped, lines
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Source init.lua
vim.keymap.set("n", "<leader>sv", ":source<space>~/.config/nvim/init.lua<CR>")

-- Binding pry shortcut
vim.keymap.set("n", "<leader>bro", "orequire'pry';binding.pry<esc>:w<cr>")

-- Easy current filepath
vim.keymap.set("c", "%%", "getcmdtype() == ':' ? expand('%:h').'/' : '%%'", { expr = true })

-- Switch between the last two files
vim.keymap.set("n", "<leader><leader>", "<c-^>")

-- Override dot in visual mode to send a 'normal mode' dot
vim.keymap.set("x", ".", ":normal .<CR>")

-- Use the @ key in visual mode to apply a given macro
vim.keymap.set("x", "@", ":<C-u>call ExecuteMacroOverVisualRange()<CR>")
vim.api.nvim_exec(
  [[
    function! ExecuteMacroOverVisualRange()
      echo "@".getcmdline()
      execute ":'<,'>normal @".nr2char(getchar())
    endfunction
  ]],
  false
)

-- Just place your caret on a word, hit c* and type, hit <esc> and then hit .
-- as many time as you want to repeat
vim.keymap.set("n", "c*", "*Ncgn")
vim.keymap.set("n", "c#", "#NcgN")
vim.keymap.set("n", "d*", "*Ndgn")
vim.keymap.set("n", "d#", "#NdgN")

-- Toggle fold at current location
vim.keymap.set("n", "<Tab>", "za")

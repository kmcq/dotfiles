-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

-- File tree
vim.keymap.set("n", "-", "<leader>fE", { desc = "Explorer NeoTree (cwd)", remap = true })

-- Search
vim.keymap.set("n", "<C-t>", "<leader>ff", { desc = "Search Files", remap = true })
vim.keymap.set("n", "]c", "]h", { desc = "Next Hunk", remap = true })
vim.keymap.set("n", "[c", "[h", { desc = "Prev Hunk", remap = true })

vim.keymap.set("n", "c*", "*Ncgn")

vim.keymap.set("n", "\\", Util.telescope("live_grep"))

-- Remove some lazy keymaps
vim.keymap.del({ "i", "n", "v" }, "<A-j>")
vim.keymap.del({ "i", "n", "v" }, "<A-k>")

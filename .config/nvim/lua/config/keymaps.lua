-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap.set

-- JK for escaping
keymap("i", "jk", "<esc>")
keymap("t", "jk", "<c-\\><c-n>")

-- Oil
keymap("n", "-", "<cmd>Oil<cr>", { desc = "Open Oil" })

vim.g.mapleader = " "

vim.o.wrap = false
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.winborder = "rounded"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.undofile = true
vim.o.autoread = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

-- Automatically reload external changes
vim.opt.autoread = true

--  How to display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- No line numbers in nvim terminals
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("setlocal nonumber norelativenumber")
  end,
})

if vim.g.neovide then
  vim.o.guifont = "ZedMono Nerd Font:h14"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0
  vim.keymap.set({ "n" }, "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end)
  vim.keymap.set({ "n" }, "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end)
end

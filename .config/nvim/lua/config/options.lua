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
vim.o.showtabline = 2
-- vim.o.cursorlineopt = "number"
vim.o.undofile = true
vim.o.autoread = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.exrc = true

-- Automatically reload external changes
vim.opt.autoread = true

--  How to display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

vim.opt.exrc = true
vim.opt.secure = true

local workspace_path = vim.fn.getcwd()
local cache_dir = vim.fn.stdpath("data")
local project_name = vim.fn.fnamemodify(workspace_path, ":t")
local project_dir = cache_dir .. "/myshada" .. project_name

if vim.fn.isdirectory(project_dir) == 0 then
  vim.fn.mkdir(project_dir, "p")
end

local shadafile = project_dir .. "/" .. vim.fn.sha256(workspace_path):sub(1, 8) .. ".shada"
vim.opt.shadafile = shadafile

vim.keymap.set("n", "<leader>fm", function()
  require("snacks").marks({ cwd = project_dir })
end)

-- No line numbers in nvim terminals
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("setlocal nonumber norelativenumber")
  end,
})

-- Cursorline only in active window
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  pattern = "*",
  callback = function()
    vim.wo.cursorline = false
  end,
})

if vim.g.neovide then
  vim.o.guifont = "ZedMono Nerd Font:h14"
  vim.opt.linespace = 4
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0
  vim.keymap.set({ "n" }, "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end)
  vim.keymap.set({ "n" }, "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end)
end

-- Set up hybrid line numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Allow using mouse
vim.opt.mouse = "a"

-- Default indent options
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Hide the default status mode, we'll show it in our status line
vim.opt.showmode = false

-- Save our undo history
vim.opt.undofile = true

-- Keep the signcolumn enabled by default
vim.opt.signcolumn = "yes"

-- Automatically reload external changes
vim.opt.autoread = true

--  How to display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}

-- Conceal level
vim.opt.conceallevel = 1

-- No line numbers in nvim terminals
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.cmd("setlocal nonumber norelativenumber")
  end,
})

if vim.g.neovide then
  vim.o.guifont = "ZedMono Nerd Font:h11"
end

-- Automatically reload a file on external changes
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})

-- Set highlight group of windows to have the darker background highlighting
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neotest-output-panel", "neotest-summary", "qf", "undotree" },
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalFloat,NormalNC:NormalFloat"
  end,
})

-- Set darker highlight for terminals
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalFloat,NormalNC:NormalFloat"
  end,
})

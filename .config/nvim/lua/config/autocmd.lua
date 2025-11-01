vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neotest-output-panel", "neotest-summary", "qf", "undotree" },
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalFloat,NormalNC:NormalFloat"
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.winhighlight = "Normal:NormalFloat,NormalNC:NormalFloat"
  end,
})

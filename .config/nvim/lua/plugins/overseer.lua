return {
  "stevearc/overseer.nvim",
  config = function()
    require("overseer").setup()

    vim.keymap.set("n", "<leader>oo", ":OverseerToggle<cr>", { desc = "Task list" })
    vim.keymap.set("n", "<leader>or", ":OverseerRun<cr>", { desc = "Run task" })
    vim.keymap.set("n", "<leader>ob", ":OverseerBuild<cr>", { desc = "Build task" })
    vim.keymap.set("n", "<leader>oi", ":OverseerInfo<cr>", { desc = "Overseer info" })
    vim.keymap.set("n", "<leader>oq", ":OverseerQuickAction<cr>", { desc = "Quick action" })
  end,
}

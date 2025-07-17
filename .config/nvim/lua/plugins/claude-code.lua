return {
  "greggh/claude-code.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("claude-code").setup()

    vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude Code" })
  end,
}

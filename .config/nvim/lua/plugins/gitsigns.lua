return {
  "lewis6991/gitsigns.nvim",

  config = function()
    require("gitsigns").setup()

    vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk<cr>", { desc = "Git Preview Hunk" })
    vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>", { desc = "Git Toggle Blame" })
  end,
}

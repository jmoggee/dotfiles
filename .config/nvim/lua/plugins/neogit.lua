return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    local neogit = require("neogit")
    neogit.setup()

    vim.keymap.set("n", "<leader>gg", ":Neogit<CR>", { desc = "Open git" })
    vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Open git diff" })
  end,
}

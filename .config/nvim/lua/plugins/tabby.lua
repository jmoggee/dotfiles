return {
  "nanozuki/tabby.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.keymap.set("n", "<leader><Tab>r", ":Tabby rename_tab ", { desc = "Rename tab" })
  end,
}

return {
  "nanozuki/tabby.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("tabby").setup()

    vim.keymap.set("n", "<leader><Tab>r", ":Tabby rename_tab ", { desc = "Rename tab" })
  end,
}

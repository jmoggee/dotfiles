return {
  "nvim-neo-tree/neo-tree.nvim",

  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },

  config = function()
    vim.keymap.set("n", "<leader>fe", ":Neotree filesystem reveal left<cr>", { desc = "File Tree (Left)" })
    vim.keymap.set("n", "<leader>fv", ":Neotree position=current<cr>", { desc = "File Tree (Current Buffer)" })
  end,
}

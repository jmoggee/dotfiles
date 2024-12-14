return {
  "aaronik/treewalker.nvim",
  opts = {
    highlight = true,
  },

  config = function()
    vim.api.nvim_set_keymap("n", "<A-j>", ":Treewalker Down<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<A-k>", ":Treewalker Up<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<A-h>", ":Treewalker Left<CR>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<A-l>", ":Treewalker Right<CR>", { noremap = true })
  end,
}

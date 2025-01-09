return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "File find" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "File recent" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "File grep" },
    { "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "File buffers" },
  },
  config = function()
    require("fzf-lua").setup({})
  end,
}

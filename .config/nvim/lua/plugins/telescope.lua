return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "albenisolmos/telescope-oil.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },

  lazy = false,

  keys = {
    { "<leader><leader>", "<cmd>Telescope frecency workspace=CWD<cr>", desc = "File find frecency" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File find" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "File recent" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "File grep" },
    { "<leader>fd", "<cmd>Telescope oil<cr>", desc = "File directories" },
    { "<leader>bb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "File buffers" },
  },

  config = function()
    require("telescope").setup({
      pickers = {
        oldfiles = {
          cwd_only = true,
        },
      },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("frecency")
  end,
}

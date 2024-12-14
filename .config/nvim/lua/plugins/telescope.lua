return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",

      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope find files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope live grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>fh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope help tags",
    },
  },

  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
  end,
}

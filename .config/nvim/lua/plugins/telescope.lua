return {
  {
    "nvim-telescope/telescope.nvim",

    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>??", builtin.help_tags, {})
    end,
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",

    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },

  {
    "nvim-telescope/telescope-frecency.nvim",

    config = function()
      local telescope = require("telescope")
      telescope.load_extension("frecency")

      vim.keymap.set("n", "<leader>fy", function()
        telescope.extensions.frecency.frecency()
      end, { desc = "Search frequency in all files" })

      vim.keymap.set("n", "<leader>fw", function()
        telescope.extensions.frecency.frecency({
          workspace = vim.fn.getcwd(),
        })
      end, { desc = "Search frequency in current workspace" })
    end,
  },
}

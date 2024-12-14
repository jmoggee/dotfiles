return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  keys = {
    { "<leader>am", "", desc = "avante: model" },
    {
      "<leader>amh",
      function()
        local avante = require("avante")
        local model = "claude-3-5-haiku-20241022"
        avante.setup({ provider = "claude", claude = { model = model } })
        vim.notify("Switched to " .. model)
      end,
      desc = "Switch to claude-3-5-haiku-20241022",
    },
    {
      "<leader>ams",
      function()
        local avante = require("avante")
        local model = "claude-3-5-sonnet-20241022"
        avante.setup({ provider = "claude", claude = { model = model } })
        vim.notify("Switched to " .. model)
      end,
      desc = "Switch to claude-3-5-sonnet-20241022",
    },
  },
  opts = {
    provider = "claude",
    claude = {
      model = "claude-3-5-sonnet-20241022",
    },
    behaviour = {
      auto_suggestions = false,
    },
  },
  build = "make",
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}

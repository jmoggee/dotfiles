return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  -- stylua: ignore
  keys = {
    { "s",          mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "<leader>jj", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",          mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "<leader>jJ", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "<leader>jt", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "<leader>jT", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-j>",      mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}

return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Test runners
    "nvim-neotest/neotest-python",
  },

  opts = {
    adapters = {
      ["neotest-python"] = {},
    },
  },
}

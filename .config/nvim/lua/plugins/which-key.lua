return {
  "folke/which-key.nvim",

  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local wk = require("which-key")

    wk.setup()
  end
}

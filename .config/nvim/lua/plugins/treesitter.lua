return {
  "nvim-treesitter/nvim-treesitter",

  build = ":TSUpdate",

  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "gdscript" }
      },
      ensure_installed = {
        "bash",
        "c_sharp",
        "css",
        "dockerfile",
        "gdscript",
        "godot_resource",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "regex",
        "scss",
        "toml",
        "python",
        "htmldjango"
      }
    })
  end,
}

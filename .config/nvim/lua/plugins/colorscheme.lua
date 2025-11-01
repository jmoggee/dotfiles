return {
  {
    "vague-theme/vague.nvim",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("vague")

      -- Only set custom statusline highlights if using vague colorscheme
      if vim.g.colors_name == "vague" then
        local colors = require("vague.config.internal").current.colors

        vim.api.nvim_set_hl(0, "MiniStatuslineFilename", {
          fg = colors.fg,
          bg = colors.inactiveBg,
        })
        vim.api.nvim_set_hl(0, "MiniStatuslineInactive", {
          fg = colors.comment,
          bg = colors.inactiveBg,
        })
      end
    end,
  },
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
}

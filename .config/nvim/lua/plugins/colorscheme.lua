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
      -- vim.cmd.colorscheme("tokyonight-night")
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
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
  },
  {
    "webhooked/kanso.nvim",
    priority = 1000,
    opts = {
      overrides = function(colors)
        local theme = colors.theme
        return {
          WinSeparator = { fg = colors.palette.inkBg0 },
          StatusLine = { fg = theme.ui.fg_dim, bg = colors.palette.inkBg0 },
          StatusLineNC = { fg = theme.ui.nontext, bg = colors.palette.inkBg0 },
          MiniStatuslineFilename = { fg = theme.ui.fg_dim, bg = colors.palette.inkBg0 },
          NormalFloat = { fg = theme.ui.fg, bg = colors.palette.inkBg0 },
          FloatBorder = { fg = theme.ui.float.fg_border, bg = colors.palette.inkBg0 },
          FloatTitle = { fg = theme.ui.special, bg = colors.palette.inkBg0, bold = true },
        }
      end,
    },
    config = function(_, opts)
      require("kanso").setup(opts)
      vim.cmd.colorscheme("kanso-zen")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    priority = 1000,
  },
}

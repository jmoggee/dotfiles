return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, colors)
          hl.CursorLine = { bg = colors.bg_float }
          hl.DapBreakpoint = { fg = colors.red }
          hl.DapBreakpointLine = { bg = "#2d1a1a" }
          hl.DapStopped = { fg = colors.green }
          hl.DapStoppedLine = { bg = "#1a2d1a" }
        end,
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
  },
}

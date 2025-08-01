local M = {}

local function get_git_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    return nil
  end
  return git_root
end

-- Dynamically determine what header to display,
-- are we displaying a logo in the gitroot, or our default
-- neovim header?
local function header_section(git_root)
  local fallback = { section = "header" }

  if not git_root then
    return fallback
  end

  local chafa_file = git_root .. "/.chafa.png"
  if vim.fn.filereadable(chafa_file) == 1 then
    return {
      section = "terminal",
      cmd = "chafa " .. vim.fn.shellescape(chafa_file) .. " --format symbols --size 42x42",
      height = 22,
      padding = 1,
      indent = 4,
    }
  end

  return fallback
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    dashboard = {
      enabled = true,
      width = 46,
      sections = {
        header_section(get_git_root()),
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
      preset = {
        keys = {
          { icon = "󰈞 ", key = "f", desc = "Find File", action = ":Telescope find_files" },
          { icon = "󰈔 ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = "󰊄 ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
          { icon = "󰋚 ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
          {
            icon = "󰒓 ",
            key = "c",
            desc = "Config",
            action = ":Telescope find_files cwd=" .. vim.fn.stdpath("config"),
          },
          { icon = "󰁯 ", key = "s", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy" },
          { icon = "󰅚 ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}

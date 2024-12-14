local M = {}

local function concat_tables(t1, t2)
  for _, v in ipairs(t2) do
    table.insert(t1, v)
  end
  return t1
end

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
      cmd = "chafa " .. vim.fn.shellescape(chafa_file) .. " --format symbols --size 50x50; sleep .1",
      height = 25,
      padding = 1,
      indent = 4,
    }
  end

  return fallback
end

local function git_sections(git_root)
  if not git_root then
    return {}
  end

  return {
    {
      pane = 2,
      section = "terminal",
      enabled = true,
      cmd = "colorscript -e square",
      height = 5,
      padding = 1,
    },

    {
      pane = 2,
      icon = " ",
      desc = "Browse Repo",
      padding = 1,
      key = "b",
      action = function()
        Snacks.gitbrowse()
      end,
    },

    function()
      local cmds = {
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "hub status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 0,
          indent = 3,
        },

        {
          title = "Open Issues",
          cmd = "gh issue list -L 8",
          key = "i",
          action = function()
            vim.fn.jobstart("gh issue list --web", { detach = true })
          end,
          icon = " ",
          height = 12,
        },

        {
          icon = " ",
          title = "Open PRs",
          cmd = "gh pr list -L 8",
          key = "p",
          action = function()
            vim.fn.jobstart("gh pr list --web", { detach = true })
          end,
          height = 12,
        },
      }

      return vim.tbl_map(function(cmd)
        return vim.tbl_extend("force", {
          pane = 2,
          section = "terminal",
          enabled = true,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        }, cmd)
      end, cmds)
    end,
  }
end

-- Main function to generate sections
function M.generate_dashboard_sections()
  local git_root = get_git_root()
  local sections = {
    header_section(git_root),
    { section = "keys", gap = 1, padding = 1 },
    { section = "startup" },
  }

  sections = concat_tables(sections, git_sections(git_root))

  -- Filter out sections that are nil (e.g., when not in git)
  return vim.tbl_filter(function(section)
    return section ~= nil
  end, sections)
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
      sections = M.generate_dashboard_sections(),
    },
  },
}

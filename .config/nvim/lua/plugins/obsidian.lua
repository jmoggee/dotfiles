return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "Obsidian",
        path = "~/Obsidian",
      },
    },
  },
}

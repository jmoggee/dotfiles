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
  config = function(_, opts)
    require("obsidian").setup(opts)

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}

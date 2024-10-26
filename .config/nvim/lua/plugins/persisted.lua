return {
  "olimorris/persisted.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local persisted = require("persisted")
    local telescope = require("telescope")

    persisted.setup({
      use_git_branch = true,
    })
    telescope.load_extension("persisted")

    vim.keymap.set("n", "<leader>ss", function() telescope.extensions.persisted.persisted() end)
    vim.keymap.set("n", "<leader>sn", persisted.start)
    vim.keymap.set("n", "<leader>sk", persisted.stop)
    vim.keymap.set("n", "<leader>sd", persisted.delete)
    vim.keymap.set("n", "<leader>sl", function() persisted.load({ last = true }) end)
  end
}

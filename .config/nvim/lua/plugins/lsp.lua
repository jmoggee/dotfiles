local function discover_lsps()
  local capabilities = require("blink.cmp").get_lsp_capabilities()
  local lspconfig = require("lspconfig")
  local server_path = vim.fn.stdpath("config") .. "/lua/plugins/lsp"

  for _, file in ipairs(vim.fn.readdir(server_path)) do
    local server_name = file:gsub("%.lua$", "")
    if server_name ~= "init" then
      local server = require("plugins.lsp." .. server_name)
      if type(server) == "table" then
        server.capabilities = capabilities
        lspconfig[server.name].setup(server)
      end
    end
  end
end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:crashdummyy/mason-registry",
        },
      })
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        auto_install = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      discover_lsps()

      -- Keymaps for diagnostics
      vim.api.nvim_set_keymap(
        "n",
        "<leader>do",
        "<cmd>lua vim.diagnostic.open_float()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>dp",
        "<cmd>lua vim.diagnostic.goto_prev()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap(
        "n",
        "<leader>dn",
        "<cmd>lua vim.diagnostic.goto_next()<CR>",
        { noremap = true, silent = true }
      )
      vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>Telescope diagnostics<CR>", { noremap = true, silent = true })
    end,
  },
}

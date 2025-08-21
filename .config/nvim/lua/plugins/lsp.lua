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
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      -- Configure ElixirLS
      lspconfig.elixirls.setup({
        cmd = { "elixir-ls" },
        capabilities = capabilities,
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = true,
            suggestSpecs = true,
            mcpEnabled = true,
            mcpPort = 3789,
          },
        },
      })

      -- Configure lua_ls
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

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

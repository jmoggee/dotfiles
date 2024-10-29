return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
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
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })

      lspconfig.basedpyright.setup({
        capabilities = (function()
          local updatedCapabilities = vim.lsp.protocol.make_client_capabilities()
          updatedCapabilities.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return updatedCapabilities
        end)(),
        settings = {
          basedpyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              ignore = { "*" },
            },
          },
        },
      })

      lspconfig.gdscript.setup({
        capabilities = capabilities,
      })

      lspconfig.gdshader_lsp.setup({
        capabilities = capabilities,
      })

      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
        on_attach = function(_client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.code_action({
                context = { only = { "source.organizeImports" } },
                apply = true,
              })
              vim.wait(100)
            end,
          })
        end,
      })

      -- lspconfig.csharp_ls.setup({
      --   capabilities = capabilities,
      -- })

      local function get_solution_path()
        return "/Users/jean/Sandbox/HarambeePlatform/HarambeePlatform.sln"
      end

      local omnisharp_bin = "/usr/local/bin/omnisharp-roslyn/OmniSharp"
      lspconfig.omnisharp.setup({
        capabilities = capabilities,
        cmd = { omnisharp_bin, "--languageserver", "--hostPID=" .. tostring(pid), "-s", get_solution_path() },
        cmd_env = {
          DOTNET_ROOT = "/usr/local/share/dotnet/x64",
          DOTNET_HOST_PATH = "/usr/local/share/dotnet/x64/dotnet",
          MSBuildSDKsPath = "/usr/local/share/dotnet/x64/sdk/8.0.100/Sdks",
          PATH = "/usr/local/share/dotnet/x64:" .. vim.env.PATH,
          DYLD_LIBRARY_PATH = "/usr/local/lib",
          ARCH = "x64",
        },
      })

      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Reformat Code" })
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
      vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "Rename" })

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end,
  },
}

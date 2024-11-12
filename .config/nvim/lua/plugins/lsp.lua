return {
  "neovim/nvim-lspconfig",
  opts = {
    autoformat = true,

    servers = {

      typos_lsp = {},
      lua_ls = {},
      ts_ls = {},
      gdscript = {},
      gdshader_lsp = {},

      basedpyright = {
        capabilities = function()
          local caps = vim.lsp.protocol.make_client_capabilities()
          caps.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
          return caps
        end,
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
      },

      ruff_lsp = {
        on_attach = function(client, bufnr)
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
      },
    },
  },
}

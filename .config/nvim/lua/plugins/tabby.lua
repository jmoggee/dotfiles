return {
  "nanozuki/tabby.nvim",
  config = function()
    local theme = {
      fill = "TabLineFill",
      current_tab = "TabLineSel",
      tab = "TabLine",
    }
    require("tabby").setup({
      line = function(line)
        return {
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              " ",
              tab.name(),
              " ",
              hl = hl,
            }
          end),
          line.spacer(),
          hl = theme.fill,
        }
      end,
    })

    vim.keymap.set("n", "<leader>t,", function()
      local snacks = require("snacks")
      snacks.input({ prompt = "Tab name: " }, function(input)
        if input then
          vim.cmd("Tabby rename_tab " .. input)
        end
      end)
    end)

    vim.keymap.set("n", "<leader>tc", "<cmd>tabnew<cr>")
    vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<cr>")
    vim.keymap.set("n", "<leader>tp", "<cmd>tabprev<cr>")
  end,
}

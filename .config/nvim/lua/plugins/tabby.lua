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

    vim.keymap.set("n", "<leader>w,", function()
      local snacks = require("snacks")
      snacks.input({ prompt = "Tab name: " }, function(input)
        if input then
          vim.cmd("Tabby rename_tab " .. input)
        end
      end)
    end)

    vim.keymap.set("n", "<leader>wc", "<cmd>tabnew<cr>")
    vim.keymap.set("n", "<leader>wn", "<cmd>tabnext<cr>")
    vim.keymap.set("n", "<leader>wp", "<cmd>tabprev<cr>")
  end,
}

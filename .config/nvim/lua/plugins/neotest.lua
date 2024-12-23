return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- Test runners
    "jfpedroza/neotest-elixir",
  },

  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-elixir"),
      },
    })

    vim.keymap.set("n", "<leader>tt", function()
      neotest.run.run({ suite = true })
      neotest.summary.open()
    end, { desc = "Test Suite (All)" })

    vim.keymap.set("n", "<leader>tn", function()
      neotest.run.run()
    end, { desc = "Test Nearest" })

    vim.keymap.set("n", "<leader>tl", function()
      neotest.run.run_last()
    end, { desc = "Test Last" })

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end, { silent = true })

    vim.keymap.set("n", "<leader>tx", function()
      neotest.run.stop()
    end)

    vim.keymap.set("n", "<leader>ts", function()
      neotest.summary.toggle()
    end, { silent = true })

    vim.keymap.set("n", "<leader>to", function()
      neotest.output.open({ enter = true })
    end)

    vim.keymap.set("n", "<leader>tp", function()
      neotest.output_panel.toggle()
    end)

    vim.keymap.set("n", "<leader>t,", function()
      neotest.jump.prev({ status = "failed" })
    end)

    vim.keymap.set("n", "<leader>t;", function()
      neotest.jump.next({ status = "failed" })
    end)
  end,
}

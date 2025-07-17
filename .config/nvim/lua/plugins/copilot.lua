return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",

  config = function()
    require("copilot").setup({
      suggestion = {
        auto_trigger = true,
      },
    })

    vim.keymap.set("i", "<A-m>", require("copilot.suggestion").accept_line)
    vim.keymap.set("i", "<A-n>", require("copilot.suggestion").accept_word)
  end,
}

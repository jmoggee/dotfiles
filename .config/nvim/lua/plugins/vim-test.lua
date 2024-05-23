return {
  "vim-test/vim-test",

  dependencies = {
    "preservim/vimux",
  },

  config = function()
    vim.keymap.set("n", "<leader>tt", ":TestNearest<cr>")
    vim.keymap.set("n", "<leader>tf", ":TestFile<cr>")
    vim.keymap.set("n", "<leader>ta", ":TestSuite<cr>")
    vim.keymap.set("n", "<leader>tl", ":TestLast<cr>")
    vim.keymap.set("n", "<leader>tg", ":TestVisit<cr>")

    vim.g["test#strategy"] = "vimux"
    vim.g["test#python#runner"] = "pytest"
  end,
}

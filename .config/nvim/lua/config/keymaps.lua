-- JK for escaping
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("t", "jk", "<c-\\><c-n>")

-- Navigation between splits
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move between tabs
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })
-- Some plugins like neogit has tab mapped to other functions, use with ctrl as an alternative
vim.keymap.set("n", "<C-Tab>", ":tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous tab" })
vim.keymap.set("n", "<leader><Tab>x", ":tabclose<cr>", { desc = "Close tab" })

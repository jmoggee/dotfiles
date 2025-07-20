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

-- Move between buffers
vim.keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Signature help" })
vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.rename, { desc = "Rename" })

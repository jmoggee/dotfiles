return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- Test runners
		"nvim-neotest/neotest-python",
	},

	config = function()
		local neotest = require("neotest")

		neotest.setup({
			adapters = {
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
			},
		})

		vim.keymap.set("n", "<leader>tt", ":lua require('neotest').run.run({ suite = true })<cr>", { silent = true })
		vim.keymap.set("n", "<leader>tn", ":lua require('neotest').run.run()<cr>", { silent = true })
		vim.keymap.set(
			"n",
			"<leader>td",
			":lua require('neotest').run.run({ strategy = 'dap' })<cr>",
			{ silent = true }
		)
		vim.keymap.set("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { silent = true })
		vim.keymap.set("n", "<leader>tk", ":lua require('neotest').run.stop()<cr>", { silent = true })
		vim.keymap.set("n", "<leader>ts", ":lua require('neotest').summary.toggle()<cr>", { silent = true })
		vim.keymap.set(
			"n",
			"<leader>to",
			":lua require('neotest').output.open({ enter = true })<cr>",
			{ silent = true }
		)
		vim.keymap.set("n", "<leader>tp", ":lua require('neotest').output_panel.toggle()<cr>", { silent = true })
		vim.keymap.set(
			"n",
			"<leader>t,",
			":lua require('neotest').jump.prev({ status = 'failed' })<cr>",
			{ silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>t;",
			":lua require('neotest').jump.next({ status = 'failed' })<cr>",
			{ silent = true }
		)
	end,
}

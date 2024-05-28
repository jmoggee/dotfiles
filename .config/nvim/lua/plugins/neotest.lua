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

		vim.keymap.set("n", "<leader>tt", function()
			require("neotest").run.run({ suite = true })
		end)
		vim.keymap.set("n", "<leader>tn", function()
			require("neotest").run.run()
		end)
		vim.keymap.set("n", "<leader>td", function()
			require("neotest").run.run({ strategy = "dap" })
		end)
		vim.keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end, { silent = true })
		vim.keymap.set("n", "<leader>tk", function()
			require("neotest").run.stop()
		end)
		vim.keymap.set("n", "<leader>ts", function()
			require("neotest").summary.toggle()
		end, { silent = true })
		vim.keymap.set("n", "<leader>to", function()
			require("neotest").output.open({ enter = true })
		end)
		vim.keymap.set("n", "<leader>tp", function()
			require("neotest").output_panel.toggle()
		end)
		vim.keymap.set("n", "<leader>t,", function()
			require("neotest").jump.prev({ status = "failed" })
		end)
		vim.keymap.set("n", "<leader>t;", function()
			require("neotest").jump.next({ status = "failed" })
		end)
	end,
}

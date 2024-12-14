return {
	"olimorris/persisted.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local persisted = require("persisted")
		local telescope = require("telescope")

		persisted.setup({
			use_git_branch = true,
			should_save = function()
				-- Do not save if the dashboard is the current filetype
				if vim.bo.filetype == "snacks_dashboard" then
					return false
				end
				return true
			end,
		})
		telescope.load_extension("persisted")

		vim.keymap.set("n", "<leader>ss", function()
			telescope.extensions.persisted.persisted()
		end, { desc = "Session Menu" })
		vim.keymap.set("n", "<leader>sn", persisted.start, { desc = "Session New" })
		vim.keymap.set("n", "<leader>sk", persisted.stop, { desc = "Session Stop" })
		vim.keymap.set("n", "<leader>sx", persisted.delete, { desc = "Session Delete" })
		vim.keymap.set("n", "<leader>sl", function()
			persisted.load({ last = true })
		end, { desc = "Session Load Last" })
	end,
}

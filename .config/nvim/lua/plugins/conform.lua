return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				elixir = { "mix" },
				heex = { "mix" },
				lua = { "stylua" },
			},

			format_on_save = {},
		})
	end,
}

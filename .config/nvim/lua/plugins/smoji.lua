return {
	"zakissimo/smoji.nvim",
	cmd = "Smoji",
	keys = {
		{ "<leader>ge", "<cmd>Smoji<cr>", desc = "Gitmoji" },
	},
	config = function()
		require("smoji")
	end,
}

return {
	"jlcrochet/vim-razor",

	config = function()
		vim.filetype.add({
			extension = {
				cshtml = "razor",
			},
		})
	end,
}

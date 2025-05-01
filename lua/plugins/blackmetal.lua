return {
	"metalelf0/black-metal-theme-neovim",
	lazy = false,
	priority = 1000,
	config = function()
		require("black-metal").setup({
			theme = "gorgoroth",
			variant = "dark",
			dark_gutter = false,
			transparent = true,
			favor_treesitter_hl = false,
			code_style = {
				comments = "italic",
				conditionals = "none",
				functions = "none",
				keywords = "none",
				headings = "bold", -- Markdown headings
				operators = "none",
				keyword_return = "none",
				strings = "none",
				variables = "none",
			},
		})
		require("black-metal").load()
	end,
}

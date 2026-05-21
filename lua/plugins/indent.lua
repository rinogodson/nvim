return {
	{
		"nvim-mini/mini.indentscope",
		lazy = false,
		version = "*",

		config = function()
			require("mini.indentscope").setup({
				delay = 0,
				draw = {
					animation = require("mini.indentscope").gen_animation.none(),
				},

				options = {
					indent_at_cursor = true,
					n_lines = 10000,
					try_as_border = true,
				},
				symbol = "╎",
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		lazy = false,
		config = function()
			require("ibl").setup({
				indent = { char = "╎" },
				scope = { enabled = false },
			})
		end,
	},
}

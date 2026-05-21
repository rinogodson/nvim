
	return {
		"echasnovski/mini.surround",
    lazy = false,
		config = function()
			require("mini.surround").setup({
				mappings = {
					add = "za",
					delete = "zd",
					find = "zf",
					find_left = "zF",
					highlight = "zh",
					replace = "zr",
					update_n_lines = "zn",
				},
			})
		end,
	}

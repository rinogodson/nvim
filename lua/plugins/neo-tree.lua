return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("neo-tree").setup({
			popup_border_style = "solid",
			enable_git_status = false,
			default_component_configs = {
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "󰜌",
				},
				git_status = {
					symbols = {
						added = "+",
						modified = "m",
						deleted = "d",
						renamed = "r",
						untracked = "?",
						ignored = "x",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "float",
				popup = {
					title = " ",
					size = {
						width = 50,
						height = "90%",
					},
					position = "50%",
				},
			},
		})
	end,
}

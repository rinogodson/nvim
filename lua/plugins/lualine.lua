return {
		"nvim-lualine/lualine.nvim",
    lazy = false,
		config = function()
			local background_color = "#181b1b"
			local gruvbox_hard = {
				normal = {
					a = { fg = "#b8bb26", bg = background_color },
					b = { fg = "#ebdbb2", bg = background_color },
					c = { fg = "#ebdbb2", bg = background_color },
				},
				insert = {
					a = { fg = "#fabd2f", bg = background_color },
					b = { fg = "#ebdbb2", bg = background_color },
					c = { fg = "#ebdbb2", bg = background_color },
				},
				visual = {
					a = { fg = "#d3869b", bg = background_color },
					b = { fg = "#ebdbb2", bg = background_color },
					c = { fg = "#ebdbb2", bg = background_color },
				},
				replace = {
					a = { fg = "#fb4934", bg = background_color },
					b = { fg = "#ebdbb2", bg = background_color },
					c = { fg = "#ebdbb2", bg = background_color },
				},
				inactive = {
					a = { fg = "#928374", bg = background_color },
					b = { fg = "#928374", bg = background_color },
					c = { fg = "#928374", bg = background_color },
				},
			}
			require("lualine").setup({
				options = {
					theme = gruvbox_hard,
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					icons_enabled = true,
					globalstatus = true,
					disabled_filetypes = { "dashboard", "alpha", "NvimTree", "Outline" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:sub(1, 1)
							end,
						},
					},
					lualine_b = {
						{ "branch", icon = "" },
						{ "diff", colored = true, symbols = { added = "+", modified = "~", removed = "-" } },
					},
					lualine_c = {
						{
							"filename",
							file_status = true,
							path = 1,
							shorting_target = 40,
							symbols = { modified = "[+]", readonly = "[-]", unnamed = "󰇥" },
						},
					},
					lualine_x = { "encoding" },
					lualine_y = {},
					lualine_z = {
						{ "filetype", colored = true, icon_only = true },
						{ "location", padding = { left = 0, right = 0 } },
					},
				},
				tabline = {
					lualine_b = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic", "coc" },
							symbols = { error = " ", warn = " ", info = " ", hint = " " },
						},
					},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {
						{
							"tabs",
							mode = 1,
						},
					},
				},
			})
		end,
	}

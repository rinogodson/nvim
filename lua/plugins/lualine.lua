return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- Define a theme with solid black background
		local black_theme = {
			normal = {
				a = { fg = "#98c379", bg = "#000000" },
				b = { fg = "#61afef", bg = "#000000" },
				c = { fg = "#abb2bf", bg = "#000000" },
			},
			insert = {
				a = { fg = "#e5c07b", bg = "#000000" },
				b = { fg = "#61afef", bg = "#000000" },
				c = { fg = "#abb2bf", bg = "#000000" },
			},
			visual = {
				a = { fg = "#c678dd", bg = "#000000" },
				b = { fg = "#61afef", bg = "#000000" },
				c = { fg = "#abb2bf", bg = "#000000" },
			},
			replace = {
				a = { fg = "#e06c75", bg = "#000000" },
				b = { fg = "#61afef", bg = "#000000" },
				c = { fg = "#abb2bf", bg = "#000000" },
			},
			inactive = {
				a = { fg = "#5c6370", bg = "#000000" },
				b = { fg = "#5c6370", bg = "#000000" },
				c = { fg = "#5c6370", bg = "#000000" },
			},
		}

		-- Set highlight groups to enforce black background
		vim.api.nvim_set_hl(0, "LualineNormal", { bg = "#000000" })
		vim.api.nvim_set_hl(0, "LualineInsert", { bg = "#000000" })
		vim.api.nvim_set_hl(0, "LualineVisual", { bg = "#000000" })
		vim.api.nvim_set_hl(0, "LualineReplace", { bg = "#000000" })
		vim.api.nvim_set_hl(0, "LualineInactive", { bg = "#000000" })

		require("lualine").setup({
			options = {
				theme = black_theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				icons_enabled = true,
				globalstatus = true,
				disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
						icon = "♥",
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
						symbols = { modified = "[+]", readonly = "[-]", unnamed = "[No Name]" },
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sources = { "nvim_lsp" },
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					{ "encoding" },
					{ "fileformat", icons_enabled = true },
				},
				lualine_y = {
					{ "filetype", colored = true, icon_only = true },
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
				},
				lualine_z = {
					{ "location", padding = { left = 0, right = 1 } },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {
					{
						"tabs",
						mode = 2,
						max_length = vim.o.columns * 2 / 3,
						fmt = function(name, context)
							local bufnr = vim.fn.tabpagebuflist(context.tabnr)[1]
							local modified = vim.fn.getbufvar(bufnr, "&modified") == 1 and "[+]" or ""
							return name .. modified
						end,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "fugitive", "quickfix", "nvim-tree" },
		})
	end,
}

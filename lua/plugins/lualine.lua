return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		local background_color = "#1E2021"
		-- local background_color = "#1B1D1E"
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
		local mode_color = {
			n = "#b8bb26", -- normal
			i = "#fabd2f", -- visual
			v = "#d3869b", -- insert
			V = "#d3869b", -- insert
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
						"filename",
						file_status = true,
						path = 1,
						shorting_target = 40,
						symbols = { modified = "[+]", readonly = "[-]", unnamed = "󰇥" },
						color = { fg = "#665c54", bg = "#181b1b" },
						padding = { left = 1, right = 0 },
					},
					{
						function()
							return "█▓▒░"
						end,
						color = function()
							return { fg = "#181b1b" }
						end,
						padding = { left = 0, right = 0 },
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						function()
							return "░▒▓█"
						end,
						color = function()
							return { fg = "#181b1b" }
						end,
						padding = { left = 0, right = 0 },
					},
					{
						"location",
						padding = { left = 0, right = 0 },

						color = { fg = "#665c54", bg = "#181b1b" },
					},
					{ "encoding", color = { fg = "#665c54", bg = "#181b1b" } },
					{
						"diff",
						colored = true,
						symbols = { added = "+", modified = "~", removed = "-" },
						padding = { left = 0, right = 0 },
						color = { bg = "#181b1b" },
					},
					{
						"branch",
						icon = "",
						padding = { left = 0, right = 1 },
						color = { fg = "#928374", bg = "#181b1b" },
					},
					-- {
					-- 	function()
					-- 		return ""
					-- 	end,
					-- 	color = function()
					-- 		return { fg = "#1a1d1e", bg = mode_color[vim.fn.mode()] or "#ffffff", gui = "bold" }
					-- 	end,
					-- 	padding = { left = 1, right = 0 },
					-- },
					{
						"mode",
						fmt = function(str)
							if str:sub(1, 1):lower() == "n" then
								return " " .. ""
							elseif str:sub(1, 1):lower() == "v" then
								return " " .. ""
							elseif str:sub(1, 1):lower() == "i" then
								return " " .. ""
							elseif str:sub(1, 1):lower() == "c" then
								return " " .. ":"
							end
							return " " .. str:sub(1, 1):lower()
						end,
						-- color = { bg = "#8EC07C", fg = "#0A0A0A", gui = "bold" },
						color = function()
							return { fg = "#1a1d1e", bg = mode_color[vim.fn.mode()] or "#ffffff", gui = "bold" }
						end,
						padding = { right = 1 },
					},
				},
			},
			tabline = {
				lualine_b = {
					{
						"filetype",
						colored = false,
						icon_only = true,

						padding = { right = 0, left = 1 },
						color = { bg = "#181b1b", fg = "#665c54" },
					},
					{
						function()
							return "███▓▒░"
						end,
						color = function()
							return { fg = "#181b1b" }
						end,
						padding = { left = 0, right = 0 },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {
					{
						"diagnostics",
						sources = { "nvim_diagnostic", "coc" },
						symbols = { error = "e:", warn = "w:", info = "i:", hint = "h:" },
						separator = { left = "░▒▓█", right = "" },
						padding = { right = 1, left = 2 },
						color = { bg = "#181b1b" },
						gui = "bold",
					},
					{
						"tabs",
						cond = function()
							return #vim.fn.gettabinfo() > 1
						end,
						mode = 0,
						tabs_color = {
							active = { fg = "#ebdbb2", bg = "#181b1b" },
							inactive = { fg = "#928374", bg = "#1E2021" },
						},
					},
				},
			},
		})
	end,
}

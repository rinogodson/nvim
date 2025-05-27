return {
	{
		"webhooked/kanso.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Default options:
			require("kanso").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = {},
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				require("kanso").setup({
					colors = {
						palette = {
							-- change all usages of these colors
							zen0 = "#000000",
							fujiWhite = "#FFFFFF",
						},
						theme = {
							-- change specific usages for a certain theme, or for all of them
							zen = {
								ui = {
									float = {
										bg = "none",
									},
								},
							},
							ink = {
								syn = {
									parameter = "yellow",
								},
							},
							all = {
								ui = {
									bg_gutter = "none",
								},
							},
						},
					},
				}),
				overrides = function(colors) -- add/modify highlights
					return {}
				end,
				theme = "zen", -- Load "zen" theme
				background = { -- map the value of 'background' option to a theme
					dark = "zen", -- try "ink" !
					light = "pearl",
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
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

			vim.cmd.colorscheme("gorgoroth")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				term_colors = true,
				transparent_background = false,
				no_italic = false,
				no_bold = false,
				styles = {
					comments = {},
					conditionals = {},
					loops = {},
					functions = {},
					keywords = {},
					strings = {},
					variables = {},
					numbers = {},
					booleans = {},
					properties = {},
					types = {},
				},
				color_overrides = {
					mocha = {
						base = "#000000",
						mantle = "#000000",
						crust = "#000000",
					},
				},
				highlight_overrides = {
					mocha = function(C)
						return {
							TabLineSel = { bg = C.pink },
							CmpBorder = { fg = C.surface2 },
							Pmenu = { bg = C.none },
							TelescopeBorder = { link = "FloatBorder" },
						}
					end,
				},
			})
		end,
	},
}

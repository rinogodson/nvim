local header_val = {
	-- "╭╮╷╭─╴╭─╮╷ ╷╷╭┬╮",
	-- "│╰┤├╴ │ ││╭╯││││",
	-- "╵ ╵╰─╴╰─╯╰╯ ╵╵ ╵",
	-- "config by rino",
	-- "𜷋𜴧𜴧𜴧𜵡𜴧▄𜴧𜴧𜵡𜴧▄𜴧𜴧𜴧𜵡𜴧▄𜴧𜴧𜴧▄𜴧𜶜𜵡𜴧𜶻",
	-- "▌𜷥▀🬺 🬺 𜷥𜶩🬏𜷤 𜷥𜵠𜷤 𜷤 𜷥 🬺 𜷥𜶠𜵩𜷤▐",
	-- "▌𜶫𜴅𜶩 𜶫 𜶫🬁𜶩𜵰 𜶫𜷟𜵰𜺠𜴦▄𜴗𜺣𜶫 𜶫𜶑𜵅𜵰▐",
	-- "𜴅𜴆𜴈𜴆𜴈𜴆𜴈𜴆𜴈𜴆𜴆▀𜴆𜴆𜴆▀𜴇𜴆𜴈▀𜴆𜴈𜴆𜴈𜴇𜴆𜴂",
	"",
	"𜷋𜴧𜴧𜴧𜵡𜴧▄𜴧𜴧𜵡𜴧▄𜴧𜴧𜴧𜵡𜴧▄𜴧𜴧𜴧▄𜴧𜶜𜵡𜴧𜶻",
	"▌𜷥▀🬺 🬺 𜷥𜶩🬏𜷤 𜷥𜵄𜷤 𜷤 𜷥 🬺 𜷥𜶠𜵩𜷤▐",
	"▌𜶫𜴅𜶩 𜶫 𜶫🬁𜶩𜵰 𜶫𜷜𜵰𜺠𜴦▄𜴗𜺣𜶫 𜶫𜶖𜵈𜵰▐",
	"𜴅𜴆𜴈𜴆𜴈𜴆𜴈𜴆𜴈𜴆𜴆▀𜴆𜴆𜴆▀𜴇𜴆𜴈▀𜴆𜴈𜴆𜴈𜴇𜴆𜴂",
	"config by @rinogodson",
}

local hl = {
	{ { "AlphaContFill", 0, 104 } },
	{ { "AlphaContFill", 0, 104 } },
	{
		{ "AlphaContFill", 0, 3 },
		{ "AlphaNameFill", 3, 47 },
		{ "AlphaGemFill", 47, 51 },
		{ "AlphaNameFill", 51, 93 },
		{ "AlphaContFill", 93, 96 },
	},
	{
		{ "AlphaContFill", 0, 3 },
		{ "AlphaNameFill", 3, 47 },
		{ "AlphaGemFill", 47, 51 },
		{ "AlphaNameFill", 52, 56 },
		{ "AlphaContFill", 56, 60 },
		{ "AlphaNameFill", 60, 71 },
		{ "AlphaContFill", 71, 75 },
		{ "AlphaNameFill", 75, 84 },
		{ "AlphaContFill", 84, 92 },
		{ "AlphaNameFill", 92, 96 },
		{ "AlphaContFill", 96, 99 },
	},
	{ { "AlphaContFill", 0, 104 } },
	{ { "AlphaContFill", 0, 104 } },
}
return {
	"goolord/alpha-nvim",
	lazy = false,
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		vim.api.nvim_set_hl(0, "AlphaContFill", { fg = "#3C3836" })
		vim.api.nvim_set_hl(0, "AlphaContentTitle", { fg = "#fabd2f" })
		vim.api.nvim_set_hl(0, "AlphaButton", { fg = "#ebdbb2" })
		vim.api.nvim_set_hl(0, "AlphaNameFill", { fg = "#b8bb26" })
		vim.api.nvim_set_hl(0, "AlphaGemFill", { fg = "#b8bb26", bg = "#5B5E14" })
		vim.api.nvim_set_hl(0, "AlphaIcons", { fg = "#918374" })
		vim.api.nvim_set_hl(0, "AlphaBrackets", { fg = "#3C3836" })
		vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fb4934", bold = true })

		startify.section.header.opts.hl = hl
		startify.section.header.val = header_val
		startify.section.header.opts.shrink_margin = true

		local buttonfn = function(a, b, c)
			local result = startify.button(a, b, c)
			result.opts.shortcut = "{" .. a .. "} "

			result.opts.hl_shortcut =
				{ { "AlphaBrackets", 0, 1 }, { "AlphaShortcut", 1, #a + 1 }, { "AlphaBrackets", #a + 1, #a + 2 } }

			return result
		end
		local mrufn = function(a, b)
			local result = startify.button(a, b)
			result.opts.shortcut = "{" .. a .. "} "

			result.opts.hl_shortcut =
				{ { "AlphaBrackets", 0, 1 }, { "AlphaShortcut", 1, #a + 1 }, { "AlphaBrackets", #a + 1, #a + 2 } }

			return result
		end

		startify.section.top_buttons.val = {
			buttonfn("s", "󱐋 picker", ':lua require("snacks").picker.files() <CR>'),
			buttonfn("o", " open last", "<cmd>normal! '0<CR>"),
			buttonfn("e", "󰇥 start blank", ":ene <BAR> startinsert <CR>"),
			buttonfn("q", " quit vim", ":qa<CR>"),
		}

		startify.section.bottom_buttons.val = {
			buttonfn("g", "󰩕 go up", "<cmd>normal! gg<CR>"),
		}

		startify.file_icons.highlight = "AlphaIcons"

		startify.section.mru_cwd = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				{
					type = "text",
					val = "recent files:",
					opts = { hl = "AlphaContentTitle", shrink_margin = false },
				},
				{
					type = "text",
					val = "┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉",
					opts = { hl = "AlphaContFill", shrink_margin = false },
				},
				{
					type = "group",
					val = function()
						return { startify.mru(1, vim.fn.getcwd(), 5) }
					end,
					opts = { shrink_margin = true },
				},
			},
		}

		startify.section.mru = {
			type = "group",
			val = {
				{ type = "padding", val = 1 },
				{
					type = "text",
					val = "recent files (global):",
					opts = { hl = "AlphaContentTitle", shrink_margin = false },
				},
				{
					type = "text",
					val = "┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉┉",
					opts = { hl = "AlphaContFill", shrink_margin = false },
				},
				{
					type = "group",
					val = function()
						return { startify.mru(6, _, 5) }
					end,
					opts = { shrink_margin = true },
				},
			},
		}

		alpha.setup(startify.config)
	end,
}

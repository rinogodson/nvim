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
		vim.api.nvim_set_hl(0, "AlphaBracketCustom", { fg = "#3C3836" })
		vim.api.nvim_set_hl(0, "AlphaNumberCustom", { fg = "#FE8018", bold = true })
		vim.api.nvim_set_hl(0, "AlphaDark", { fg = "#191B1B", bold = true })

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

		startify.section.top_buttons.val = {
			{
				type = "text",
				val = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━𜱶",
				opts = { hl = "AlphaDark", shrink_margin = false },
			},
			buttonfn("s", "󱐋 picker", ':lua require("snacks").picker.files() <CR>'),
			buttonfn("o", " open last", "<cmd>normal! '0<CR>"),
			buttonfn("e", "󰇥 start blank", ":ene <BAR> startinsert <CR>"),
			buttonfn("q", " quit vim", ":qa<CR>"),
			{
				type = "text",
				val = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━𜱶",
				opts = { hl = "AlphaDark", shrink_margin = false },
			},
		}

		startify.section.bottom_buttons.val = {

			buttonfn("g", "󰩕 go up", "<cmd>normal! gg<CR>"),
		}

		startify.file_icons.highlight = "AlphaIcons"

		startify.section.mru_cwd = {
			type = "group",
			val = {
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
				{
					type = "text",
					val = "┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅┅𜱲",
					opts = { hl = "AlphaDark", shrink_margin = false },
				},
				{
					type = "group",
					val = function()
						return { startify.mru(6, _, 4) }
					end,
					opts = { shrink_margin = true },
				},
				{
					type = "text",
					val = "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━𜱶",
					opts = { hl = "AlphaDark", shrink_margin = false },
				},
			},
		}

		local function customize_shortcuts(elements)
			for _, el in ipairs(elements) do
				if type(el) == "table" then
					if el.type == "group" and type(el.val) == "function" then
						local original_func = el.val
						el.val = function()
							local generated_elements = original_func()
							customize_shortcuts(generated_elements)
							return generated_elements
						end
					elseif el.type == "group" and type(el.val) == "table" then
						customize_shortcuts(el.val)
					elseif el.type == "button" and el.opts and el.opts.shortcut then
						local sc = el.opts.shortcut:match("%[(.*)%]")
						if sc then
							el.opts.shortcut = "[" .. sc .. "] "

							el.opts.hl_shortcut = {
								{ "AlphaBracketCustom", 0, 1 },
								{ "AlphaNumberCustom", 1, #sc + 1 },
								{ "AlphaBracketCustom", #sc + 1, #sc + 2 },
							}
						end
						if el.opts.hl and #el.opts.hl > 0 then
							local icon_hl = el.opts.hl[1]
							if icon_hl and icon_hl[2] == 0 then
								local icon_len = icon_hl[3]
								---@diagnostic disable-next-line: undefined-field
								local next_chars = el.val:sub(icon_len + 1, icon_len + 2)
								if next_chars == "  " then
									---@diagnostic disable-next-line: undefined-field
									local icon_str = el.val:sub(1, icon_len)
									---@diagnostic disable-next-line: undefined-field
									local rest_str = el.val:sub(icon_len + 3)
									el.val = icon_str .. " " .. rest_str

									for i = 2, #el.opts.hl do
										local hl_item = el.opts.hl[i]
										hl_item[2] = hl_item[2] - 1
										hl_item[3] = hl_item[3] - 1
									end
								end
							end
						end
					elseif not el.type then
						customize_shortcuts(el)
					end
				end
			end
		end

		customize_shortcuts(startify.config.layout)

		alpha.setup(startify.config)
	end,
}

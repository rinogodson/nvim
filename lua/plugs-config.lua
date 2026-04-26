require("fzf-lua").setup({
	winopts = {
		title_pos = "right",
		title_flags = false,
	},
})

require("gruvbox").setup({
	contrast = "hard",
})

require("mason").setup()
require("mason-lspconfig").setup()

-- Minimal configuration for vim.pack users
require("blink.cmp").setup({
	fuzzy = { implementation = "rust" },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		-- providers = {
		-- 	copilot = {
		-- 		name = "copilot",
		-- 		module = "blink-copilot",
		-- 		score_offset = 100,
		-- 		async = true,
		-- 	},
		-- },
	},

	keymap = {
		preset = "default",
		["<Tab>"] = {
			function(cmp)
				if cmp.snippet_active() then
					return cmp.accept()
				else
					return cmp.select_and_accept()
				end
			end,
			"snippet_forward",
			"fallback",
		},
	},

	completion = {
		ghost_text = { enabled = false },
		trigger = { prefetch_on_insert = false },
		documentation = {
			auto_show = true,
			window = {
				border = "double",
			},
		},
		menu = {
			border = "single",
			auto_show = true,
			draw = {
				padding = { 0, 1 },
				columns = {
					{ "label", "label_description", gap = 1 },
					{ "source_icon", "kind", gap = 1 },
				},
				components = {

					source_icon = {
						text = function(ctx)
							local source_icons = {
								LSP = "",
								buffer = "",
								Snippets = "",
								path = "",
								copilot = "",
							}
							return source_icons[ctx.item.source_name] or ctx.item.source_name or ""
						end,
						highlight = "BlinkCmpKind",
					},
				},
			},
		},
	},
	signature = {
		enabled = true,
		window = {
			border = "single",
			winblend = 15,
		},
	},
})

return	{
		"saghen/blink.cmp",
		version = "*",
    lazy = false,
		dependencies = { "saghen/blink.lib", "fang2hou/blink-copilot", "rafamadriz/friendly-snippets" },
		build = "cargo build --release",
		config = function()
			require("blink.cmp").setup({
				fuzzy = { implementation = "lua" },
				sources = {
					default = { "copilot", "lsp", "path", "snippets", "buffer" },
					providers = {
						copilot = {
							name = "copilot",
							module = "blink-copilot",
							score_offset = 100,
							async = true,
						},
					},
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
							padding = 1,
							columns = {
								{ "source_icon", "label", "label_description", gap = 1 },
								{ "kind", gap = 1 },
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
						border = "",
						winblend = 15,
					},
				},
			})
			vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#b8bb26", bg = "#181b1b" })
			vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#b8bb26", bg = "#181b1b" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#ebdbb2", bg = "#181b1b" })
			vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#ebdbb2", bg = "#181b1b" })
			vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#fabd2f", bg = "#312d2b" })
			vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#ebdbb2" })
		end,
	}


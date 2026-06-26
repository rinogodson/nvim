return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup({
				signcolumn = true,
				signs = {
					add = { text = "▏" },
					change = { text = "▏" },
					delete = { text = "▁" },
					topdelete = { text = "▔" },
					changedelete = { text = "~" },
					untracked = { text = "▎" },
				},
				signs_staged = {
					add = { text = "▏" },
					change = { text = "▏" },
					delete = { text = "▁" },
					topdelete = { text = "▔" },
					changedelete = { text = "~" },
					untracked = { text = "▎" },
				},
			})
		end,
	},
	"kdheepak/lazygit.nvim",
	{
		"zbirenbaum/copilot.lua",
		lazy = false,
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{ "wakatime/vim-wakatime", lazy = false, opts = { status_bar_enabled = false } },
}

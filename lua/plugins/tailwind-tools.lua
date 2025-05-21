-- tailwind-tools.lua
return {
	"luckasRanarison/tailwind-tools.nvim",
	name = "tailwind-tools",
	build = ":UpdateRemotePlugins",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim", -- optional
		"neovim/nvim-lspconfig", -- optional
	},
	config = function()
    vim.keymap.set("n", "<leader>tw", "<cmd>TailwindConcealToggle<CR>", { desc = "Toggle Tailwind Conceal" })
		require("tailwind-tools").setup({
			---@type TailwindTools.Option
			{
				server = {
					override = true, -- setup the server from the plugin if true
					settings = { -- shortcut for `settings.tailwindCSS`
						-- experimental = {
						--   classRegex = { "tw\\('([^']*)'\\)" }
						-- },
						-- includeLanguages = {
						--   elixir = "phoenix-heex",
						--   heex = "phoenix-heex",
						-- },
					},
					on_attach = function(client, bufnr) end, -- callback executed when the language server gets attached to a buffer
					root_dir = function(fname) end, -- overrides the default function for resolving the root directory
				},
				document_color = {
					enabled = true, -- can be toggled by commands
					kind = "inline", -- "inline" | "foreground" | "background"
					inline_symbol = "󰋑 ", -- only used in inline mode
					debounce = 200, -- in milliseconds, only applied in insert mode
				},
				conceal = {
					enabled = true, -- can be toggled by commands
					min_length = nil, -- only conceal classes exceeding the provided length
					symbol = "👻", -- only a single character is allowed
					highlight = { -- extmark highlight options, see :h 'highlight'
						fg = "#38BDF8",
					},
				},
				cmp = {
					highlight = "foreground", -- color preview style, "foreground" | "background"
				},
				telescope = {
					utilities = {
						callback = function(name, class) end, -- callback used when selecting an utility class in telescope
					},
				},
				-- see the extension section to learn more
				extension = {
					queries = {}, -- a list of filetypes having custom `class` queries
					patterns = { -- a map of filetypes to Lua pattern lists
						-- rust = { "class=[\"']([^\"']+)[\"']" },
						-- javascript = { "clsx%(([^)]+)%)" },
					},
				},
			},
		})
	end,
}

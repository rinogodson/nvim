return {
	{ "neovim/nvim-lspconfig", lazy = false },
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		lazy = false,
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"vtsls",
					"lua-language-server",
					"prettier",
					"stylua",
					"isort",
					"black",
					"astro",
					"pylint",
					"eslint_d",
					"tailwindcss",
					"ast_grep",
					"prettierd",
					"html",
					"cssls",
					"emmet_ls",
					"zls",
				},
			})
		end,
	},
}

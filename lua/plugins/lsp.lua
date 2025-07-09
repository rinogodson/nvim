return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.erb_lint,
					null_ls.builtins.diagnostics.rubocop,
					null_ls.builtins.formatting.rubocop,
				},
			})
		end,
	},
  {
    "github/copilot.vim"
  },
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = { "saghen/blink.cmp" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			-- Language server setups
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "astro" },
			})
			lspconfig.solargraph.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities, filetypes = { "html", "css", "astro", "vue" } })
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						inlayHints = {
							enable = true,
							parameterHints = true,
							typeHints = true,
						},
					},
				},
			})
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.astro.setup({
				init_options = {
					capabilities = capabilities,
					configuration = {},
					typescript = {
						serverPath = vim.fs.normalize(
							"/Users/rinogodson/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib/tsserverlibrary.js"
						),
					},
				},
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})

			-- Unified and improved keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "<leader>j", vim.lsp.buf.references, { desc = "Find references" })
			vim.keymap.set("n", "<leader>k", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format buffer" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}

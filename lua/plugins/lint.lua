
	return {
		"mfussenegger/nvim-lint",
    lazy=false,
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "vale" },
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	}

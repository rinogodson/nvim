return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		local ts = require("nvim-treesitter")

		ts.setup({})

		local ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"html",
			"css",
			"astro",
			"zig",
		}

		local already_installed = require("nvim-treesitter.config").get_installed()
		local to_install = vim.iter(ensure_installed)
			:filter(function(lang)
				return not vim.tbl_contains(already_installed, lang)
			end)
			:totable()

		if #to_install > 0 then
			ts.install(to_install)
		end

		local ts_group = vim.api.nvim_create_augroup("TreesitterAuto", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = ts_group,
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "" then
					return
				end

				local lang = vim.treesitter.language.get_lang(ft) or ft

				local has_parser = pcall(vim.treesitter.get_parser, args.buf, lang)

				if not has_parser then
					local available = ts.get_available()
					if vim.tbl_contains(available, lang) then
						vim.notify("Auto-installing Treesitter parser for: " .. lang, vim.log.levels.INFO)
						ts.install({ lang })
					end
				end

				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}

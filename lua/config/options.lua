vim.loader.enable()
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.wrap = false
vim.opt.fillchars = { eob = "𜸎" }
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.formatoptions:append("r")
vim.opt.ignorecase = true
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.o.confirm = true
vim.o.background = "dark"
vim.opt.ignorecase = true
vim.opt.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.timeoutlen = 500
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes:1"
vim.diagnostic.config({
	severity_sort = true,
	signs = {
		numhl = {
			[vim.diagnostic.severity.ERROR] = "DiagnosticSignErrorNum",
			[vim.diagnostic.severity.WARN] = "DiagnosticSignWarnNum",
			[vim.diagnostic.severity.INFO] = "DiagnosticSignInfoNum",
			[vim.diagnostic.severity.HINT] = "DiagnosticSignHintNum",
		},
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

local builtins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}
for _, plugin in ipairs(builtins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("syntax off")
vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

local bckg = "#181b1b"
vim.api.nvim_set_hl(0, "SignColumn", { bg = bckg })
vim.api.nvim_set_hl(0, "LineNr", { bg = "#1a1d1e", fg = "#665c54" })
vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "#312d2b", fg = "#ebdbb2", bold = true })
vim.api.nvim_set_hl(0, "GitSignsAdd", { bg = bckg, fg = "#b8bb26" })
vim.api.nvim_set_hl(0, "GitSignsChange", { bg = bckg, fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { bg = bckg, fg = "#fb4934" })
vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#fb4934" })
vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#d3869b" })
vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#b8bb26" })

vim.api.nvim_set_hl(0, "DiagnosticSignErrorNum", { bg = "#772620", fg = "#fb4934", bold = true })
vim.api.nvim_set_hl(0, "DiagnosticSignWarnNum", { bg = "#775E14", fg = "#fabd2f" })
vim.api.nvim_set_hl(0, "DiagnosticSignInfoNum", { bg = "#312d2b" })
vim.api.nvim_set_hl(0, "DiagnosticSignHintNum", { bg = "#312d2b" })

vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = "#b8bb26", bg = bckg })
vim.api.nvim_set_hl(0, "NeoTreeTitleBar", { fg = "#ebdbb2", bg = bckg })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { fg = "#ebdbb2", bg = bckg })
vim.api.nvim_set_hl(0, "MsgArea", { fg = "#928374" })

vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#5B5E14" })
vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#775E14" })
vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#772620" })
vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#772620" })
vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#772620" })
vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#706A59" })

-- vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#E06C75", nocombine = true })

-- highlight yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 100, visual = true })
	end,
})

-- restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- syntax highlighting for dotenv files
vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

-- show cursorline only in active window enable
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("active_cursorline", { clear = true }),
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

-- show cursorline only in active window disable
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = "active_cursorline",
	callback = function()
		vim.opt_local.cursorline = false
	end,
})
--
-- -- cursorline changes color on input mode here
-- local cursorline_group = vim.api.nvim_create_augroup("CursorLineModeColor", { clear = true })
--
-- vim.api.nvim_create_autocmd("InsertEnter", {
-- 	group = cursorline_group,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#312d2b" })
-- 	end,
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	group = cursorline_group,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3C3836" })
-- 	end,
-- })

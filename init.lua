vim.g.mapleader = " "

vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set fillchars=eob:`")

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-l>", "<Right>", { noremap = true, silent = true })

vim.keymap.set("n", ">", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", ">", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
vim.keymap.set("v", "<", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })

vim.cmd("set smartindent")
vim.cmd("set autoindent")
vim.cmd("set formatoptions+=r")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugins",
	install = { colorscheme = { "black-metal-theme-neovim" } },
	ui = {
		checker = {
			enabled = true, -- For enable or disable the checker.ini
			notify = false, -- For disable notifications.
		},
	},
})

vim.cmd.colorscheme("gorgoroth")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })

-- Transparent completion menu and borders
vim.cmd("highlight Pmenu guibg=NONE guifg=#d8dee9") -- Transparent bg, light text
vim.cmd("highlight PmenuSel guibg=#4c566a guifg=#eceff4") -- Subtle bg for selected item
vim.cmd("highlight NormalFloat guibg=NONE") -- Transparent documentation window
vim.cmd("highlight FloatBorder guifg=#81a1c1") -- Border color
vim.cmd("highlight BlinkCmpMenuBorder guifg=#81a1c1") -- Custom border for menu
vim.cmd("highlight BlinkCmpDocBorder guifg=#81a1c1") -- Custom border for docs
vim.cmd("highlight BlinkCmpMenuSelection guibg=#4c566a guifg=#eceff4") -- Selected item
vim.cmd("highlight BlinkCmpDocCursorLine guibg=#4c566a guifg=#eceff4") -- Docs cursor line

vim.cmd("nnoremap('<C-d>', '<C-d>zz')")
vim.cmd("nnoremap('<C-u>', '<C-u>zz')")
vim.opt.ignorecase = true
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", ctermbg = "NONE" })
vim.keymap.set({ "i", "x", "n", "s" }, "<D-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePre *",
	group = "alpha_on_empty",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local name = vim.api.nvim_buf_get_name(bufnr)

		if name == "" then
			vim.cmd([[:Alpha | bd#]])
		end
	end,
})

vim.cmd("set number")
vim.cmd("set relativenumber")

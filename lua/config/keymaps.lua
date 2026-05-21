vim.g.mapleader = " "

local key = vim.keymap

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

key.set("n", "<leader>w", "<cmd>write!<CR>", { silent = true, desc = "file saving thing :)" })
key.set({ "n", "i", "v" }, "<C-h>", "<Left>")
key.set({ "n", "i", "v" }, "<C-l>", "<Right>")
key.set({ "n", "i", "v" }, "<C-j>", "<Down>")
key.set({ "n", "i", "v" }, "<C-k>", "<Up>")

key.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { silent = true, desc = "file saving thing :)" })

key.set("n", ">", ":m .-2<CR>==", { desc = "Move line up" })
key.set("n", "<", ":m .+1<CR>==", { desc = "Move line down" })
key.set("v", ">", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
key.set("v", "<", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

key.set("n", "<leader>hc", "<cmd>WakaTimeToday<CR>")

local Snacks = require("snacks")

key.set("n", "<leader>m", function()
	require("mini.files").open()
end)

key.set("n", "<leader>n", function()
	Snacks.picker.files()
end)
key.set("n", "<leader>b", function()
	Snacks.picker.buffers()
end)
key.set("n", "<leader>fg", function()
	Snacks.picker.grep()
end)
key.set("n", "<leader>r", function()
	Snacks.picker.registers()
end)

key.set("n", "s", function()
	require("pounce").pounce({})
end)

key.set("n", "S", function()
	require("pounce").pounce({ do_repeat = true })
end)

vim.keymap.set("n", "<leader>,", function()
	vim.fn.jobstart({ "love", "." }, { detach = true })
end, { desc = "Run Love2D game" })

-- lsp keymaps

key.set("n", "<leader>fd", function()
	vim.lsp.buf.format()
end, { desc = "Format buffer" })

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		key.set("n", "<leader>J", "<cmd>FzfLua lsp_references<CR>", { desc = "References" })
		key.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
		key.set("n", "<leader>H", "<cmd>FzfLua lsp_definitions<CR>", { desc = "Definitions" })
		key.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", { desc = "Implementations" })
		key.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
		key.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		key.set("n", "<leader>D", "<cmd>FzfLua diagnostics bufnr=0<CR>", { desc = "Diagnostics (Buffer)" })
		local function bordered_hover()
			vim.lsp.buf.hover({ border = "rounded" })
		end

		local function bordered_diag()
			vim.diagnostic.open_float({ border = "rounded" })
		end

		key.set("n", "L", bordered_diag, { desc = "Line Diagnostics" })
		vim.keymap.set("n", "K", bordered_hover, { desc = "LSP: Show hover documentation" })
		key.set("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
	end,
})

vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

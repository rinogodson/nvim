vim.g.mapleader = " "

local key = vim.keymap

key.set("n", "<leader>w", "<cmd>write!<CR>", { silent = true, desc = "file saving thing :)" })
key.set({ "n", "i", "v" }, "<C-h>", "<Left>")
key.set({ "n", "i", "v" }, "<C-l>", "<Right>")
key.set({ "n", "i", "v" }, "<C-j>", "<Down>")
key.set({ "n", "i", "v" }, "<C-k>", "<Up>")

key.set("n", ">", ":m .-2<CR>==", { desc = "Move line up" })
key.set("n", "<", ":m .+1<CR>==", { desc = "Move line down" })
key.set("v", ">", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
key.set("v", "<", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })

key.set("n", "<leader>hc", "<cmd>WakaTimeToday<CR>")

-- neotree keybindings
key.set("n", "<leader>l", ":Neotree toggle right<CR>")
key.set("n", "<leader>m", ":Neotree toggle float<CR>")

-- telescope bindings
local builtin = require("telescope.builtin")
key.set("n", "<leader>n", builtin.find_files, { desc = "Telescope find files" })
key.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
key.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
key.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
key.set("n", "<leader>r", builtin.registers, { desc = "Telescope registers" })

vim.keymap.set("n", "<leader>,", function()
  vim.fn.jobstart({ "love", "." }, { detach = true })
end, { desc = "Run Love2D game" })

-- lsp keymaps

key.set("n", "<leader>j", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
key.set("n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" })
key.set("n", "<leader>h", "<cmd>Telescope lsp_definitions<CR>", { desc = "Definitions" })
key.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Implementations" })
key.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Type Definitions" })
key.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
key.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
key.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Diagnostics (Buffer)" })

local function bordered_hover()
  vim.lsp.buf.hover({ border = "rounded" })
end

local function bordered_diag()
  vim.diagnostic.open_float({ border = "rounded" })
end

key.set("n", "L", bordered_diag, { desc = "Line Diagnostics" })
vim.keymap.set("n", "K", bordered_hover, { desc = "LSP: Show hover documentation" })
key.set("n", "<leader>rs", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

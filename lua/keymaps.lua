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

-- -- telescope bindings
-- local builtin = require("telescope.builtin")
-- key.set("n", "<leader>n", builtin.find_files, { desc = "Telescope find files" })
-- key.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- key.set("n", "<leader>b", builtin.buffers, { desc = "Telescope buffers" })
-- key.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- key.set("n", "<leader>r", builtin.registers, { desc = "Telescope registers" })

key.set("n", "<leader>n", "<cmd>FzfLua files<cr>")
key.set("n", "<leader>b", "<cmd>FzfLua buffers<cr>")
key.set("n", "<leader>fg", "<cmd>FzfLua live_grep<cr>")
key.set("n", "<leader>fh", "<cmd>FzfLua tags<cr>")
key.set("n", "<leader>r", "<cmd>FzfLua registers<cr>")

vim.keymap.set("n", "<leader>,", function()
  vim.fn.jobstart({ "love", "." }, { detach = true })
end, { desc = "Run Love2D game" })

-- lsp keymaps

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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("my.lsp", { clear = true }),
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if
        not client:supports_method("textDocument/willSaveWaitUntil")
        and client:supports_method("textDocument/formatting")
    then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("my.lsp.fmt", { clear = false }),
        buffer = ev.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true })

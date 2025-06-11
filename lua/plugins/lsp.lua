return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    lazy = false, -- Ensure blink.cmp loads early
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Snippet = "",
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Variable = "󱊍",
          Module = "",
          Value = "",
          Enum = "",
          Keyword = "♥",
          Color = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
        },
      },
      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = "single",
            winblend = 5,
          },
        },
        menu = {
          draw = { treesitter = { "lsp" } },
          border = "none",
          winblend = 15,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "none",
          winblend = 15,
        },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer"},
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.erb_lint,
          null_ls.builtins.diagnostics.rubocop,
          null_ls.builtins.formatting.rubocop,
        },
      })
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer (none-ls)" })
    end,
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
      lspconfig.ts_ls.setup({ capabilities = capabilities })
      lspconfig.solargraph.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.tailwindcss.setup({ capabilities = capabilities })
      lspconfig.rust_analyzer.setup({ capabilities = capabilities })
      lspconfig.gopls.setup({ capabilities = capabilities })
      lspconfig.cssls.setup({ capabilities = capabilities })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
      vim.keymap.set("n", "<leader>h", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "<leader>j", vim.lsp.buf.references, { desc = "Find references" })
      vim.keymap.set("n", "<leader>k", vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format buffer (LSP)" })
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

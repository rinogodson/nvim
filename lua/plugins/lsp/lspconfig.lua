return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },

  opts = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion = { callSnippet = "Replace" },
          },
        },
      },
      ts_ls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      pyright = {},
    },
  },

  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local cmp_capabilities = require("blink.cmp").get_lsp_capabilities()
    for server, config in pairs(opts.servers) do
      config.capabilities = vim.tbl_deep_extend("force", cmp_capabilities, config.capabilities or {})
      if lspconfig[server] then
        lspconfig[server].setup(config)
      else
        vim.notify("LSP server not found: " .. server, vim.log.levels.WARN)
      end
    end
  end,
}

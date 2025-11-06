return {
  "neovim/nvim-lspconfig",

  opts = {
    servers = {
      lua_ls = {},
      ts_ls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      pyright = {},
      asm_lsp = {},
      ast_grep = {},
      clangd = {},
      svelte = {},
    },
  },

  config = function(_, opts)
    local capabilities_base = require("blink.cmp").get_lsp_capabilities()
    for server, config in pairs(opts.servers) do
      local capabilities = vim.tbl_deep_extend("force", capabilities_base, config.capabilities or {})
      config.capabilities = capabilities
      vim.lsp.config(server, config)
    end
  end,
}

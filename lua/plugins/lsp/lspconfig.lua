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
    local cmp_capabilities = require("blink.cmp").get_lsp_capabilities()
    local servers = opts.servers or {}

    for name, conf in pairs(servers) do
      -- Deep-extend capabilities
      conf.capabilities = vim.tbl_deep_extend("force", cmp_capabilities, conf.capabilities or {})

      -- Build config for the new LSP API (Neovim 0.11+)
      local lsp_conf = vim.lsp.config({
        name = name,
        cmd = conf.cmd,
        root_dir = conf.root_dir
          or vim.fs.root(0, { ".git", "package.json", "go.mod", "pyproject.toml" })
          or vim.fn.getcwd(),
        filetypes = conf.filetypes,
        settings = conf.settings,
        capabilities = conf.capabilities,
        on_attach = conf.on_attach,
        single_file_support = conf.single_file_support ~= false,
      })

      local ok, err = pcall(vim.lsp.start, lsp_conf)
      if not ok then
        vim.notify(("Failed to start LSP '%s': %s"):format(name, err), vim.log.levels.ERROR)
      end
    end
  end,
}

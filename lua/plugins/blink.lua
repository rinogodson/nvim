return {
  "Saghen/blink.cmp",
  event = "InsertEnter",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets", "L3MON4D3/LuaSnip", "Exafunction/codeium.nvim" },
  opts = {
    sources = {
      default = { "lsp", "snippets", "buffer", "path" },
    },
    fuzzy = { implementation = "lua" },
    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "double",
        },
      },
      menu = {
        border = "single",
        auto_show = true,
        draw = {
          padding = { 0, 1 },
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind", gap = 1 },
          },
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "single",
        winblend = 15,
      },
    },
  },
}

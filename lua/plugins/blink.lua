return {
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
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  -- opts_extend = { "sources.default" }, -- Removed as it's redundant with sources.default in opts
}

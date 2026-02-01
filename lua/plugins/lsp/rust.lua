return {
  {
    "rust-lang/rust.vim",
    ft = { "rust" },
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {

    "saecki/crates.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "Saghen/blink.cmp" },
    tag = "stable",
    ft = { "toml" },
    config = function()
      require("crates").setup()
    end,
  },
}

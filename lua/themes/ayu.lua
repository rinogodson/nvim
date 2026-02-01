return {
  "Shatur/neovim-ayu",
  config = function()
    require("ayu").setup({
      mirage = false,
      terminal = true,
      overrides = {
        NormalFloat = { bg = "#0F1419" },
        FloatBorder = { bg = "#0F1419", fg = "#0F1419" },
      },
    })
    vim.cmd([[colorscheme ayu]])
  end,
}

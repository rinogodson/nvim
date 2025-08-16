return {
  "code-biscuits/nvim-biscuits",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("nvim-biscuits").setup({
      cursor_line_only = true,
      default_config = {
        max_length = 20,
        min_distance = 5,
        prefix_string = "  ",
      },
      language_config = {
        html = {
          prefix_string = " 󰈙 ",
        },
        python = {
          disabled = true,
        },
      },
    })
    -- Run :TSUpdate to ensure that the Treesitter parsers are up to date.
    vim.cmd([[TSUpdate]])
  end,
}

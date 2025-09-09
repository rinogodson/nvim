return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_config = {
          horizontal = {
            preview_cutoff = 60,
          },
          vertical = {
            preview_cutoff = 40,
          },
        },
      },
    })
  end,
}

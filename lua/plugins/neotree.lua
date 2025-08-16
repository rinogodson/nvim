return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  lazy = false,
  opts = {},
  window = {
    position = "float",
  },
  config = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
    })
  end,
}

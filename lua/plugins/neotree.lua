return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  lazy = false,
  opts = {},
  window = {
    -- ... other window options ...
    position = "float",
    popup = {
      background = "#00000000",
    },
  },
  config = function()
    require("neo-tree").setup({
      popup_border_style = "rounded",
    })
    vim.keymap.set("n", "<leader>l", ":Neotree toggle right<CR>")
    vim.keymap.set("n", "<leader>m", ":Neotree toggle float<CR>")
  end,
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
  lazy = false,
  opts = {},
  window = {
    -- ... other window options ...
    popup = {
      background = "#00000000",
    },
  },
  config = function()
    vim.keymap.set("n", "<leader>l", ":Neotree toggle right<CR>")
    vim.keymap.set("n", "<leader>n", ":Neotree toggle float<CR>")
  end,
}

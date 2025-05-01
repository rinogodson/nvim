return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local custom_theme = {
  normal = {
    a = { fg = '#ffffff', bg = '#000000', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#000000' },
    c = { fg = '#ffffff', bg = 'none' },
  },
  insert = {
    a = { fg = '#ffffff', bg = '#000000', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#000000' },
    c = { fg = '#ffffff', bg = 'none' },
  },
  visual = {
    a = { fg = '#ffffff', bg = '#000000', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#000000' },
    c = { fg = '#ffffff', bg = 'none' },
  },
  replace = {
    a = { fg = '#ffffff', bg = '#000000', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#000000' },
    c = { fg = '#ffffff', bg = 'none' },
  },
  command = {
    a = { fg = '#ffffff', bg = '#000000', gui = 'bold' },
    b = { fg = '#ffffff', bg = '#000000' },
    c = { fg = '#ffffff', bg = 'none' },
  },
  inactive = {
    a = { fg = '#aaaaaa', bg = '#000000', gui = 'bold' },
    b = { fg = '#aaaaaa', bg = '#000000' },
    c = { fg = '#aaaaaa', bg = 'none' },
  },
}

    require("lualine").setup({
      options = {
        theme = custom_theme,
        globalstatus = false,
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
      },
    })
  end,
}

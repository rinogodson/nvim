return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local black_theme = {
      normal = {
        a = { fg = "#98c379", bg = "#04070a" },
        b = { fg = "#8C8172", bg = "#04070a" },
        c = { fg = "#abb2bf", bg = "#04070a" },
      },
      insert = {
        a = { fg = "#e5c07b", bg = "#04070a" },
        b = { fg = "#8C8172", bg = "#04070a" },
        c = { fg = "#abb2bf", bg = "#04070a" },
      },
      visual = {
        a = { fg = "#c678dd", bg = "#04070a" },
        b = { fg = "#8C8172", bg = "#04070a" },
        c = { fg = "#abb2bf", bg = "#04070a" },
      },
      replace = {
        a = { fg = "#e06c75", bg = "#04070a" },
        b = { fg = "#8C8172", bg = "#04070a" },
        c = { fg = "#abb2bf", bg = "#04070a" },
      },
      inactive = {
        a = { fg = "#5c6370", bg = "#04070a" },
        b = { fg = "#5c6370", bg = "#04070a" },
        c = { fg = "#5c6370", bg = "#04070a" },
      },
    }

    require("lualine").setup({
      options = {
        theme = black_theme,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        icons_enabled = true,
        globalstatus = true,
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(str)
              return str:sub(1, 1)
            end,
          },
        },
        lualine_b = {
          { "branch", icon = "" },
          { "diff", colored = true, symbols = { added = "+", modified = "~", removed = "-" } },
        },
        lualine_c = {
          {
            "filename",
            file_status = true,
            path = 1,
            shorting_target = 40,
            symbols = { modified = "[+]", readonly = "[-]", unnamed = "󰇥" },
          },
        },
        lualine_x = {
          { "encoding" },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 0, right = 0 } },
        },
        lualine_z = {
          { "location", padding = { left = 0, right = 0 } },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          { "filetype", colored = true, icon_only = true },
        },
        lualine_b = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
        },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          {
            "tabs",
            mode = 1,
            max_length = vim.o.columns * 2 / 3,
            fmt = function(name, _)
              return name
            end,
          },
        },
      },
      extensions = { "fugitive", "quickfix", "nvim-tree" },
    })
  end,
}

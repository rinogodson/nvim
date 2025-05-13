return {
  "webhooked/kanso.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- Default options:
    require("kanso").setup({
      compile = false,  -- enable compiling the colorscheme
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = {},
      typeStyle = {},
      transparent = false,   -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      require('kanso').setup({
        colors = {
          palette = {
            -- change all usages of these colors
            zen0 = "#000000",
            fujiWhite = "#FFFFFF",
          },
          theme = {
            -- change specific usages for a certain theme, or for all of them
            zen = {
              ui = {
                float = {
                  bg = "none",
                },
              },
            },
            ink = {
              syn = {
                parameter = "yellow",
              },
            },
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
      }),
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "zen",  -- Load "zen" theme
      background = {  -- map the value of 'background' option to a theme
        dark = "zen", -- try "ink" !
        light = "pearl",
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanso")
  end,
}

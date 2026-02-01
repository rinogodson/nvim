return {
  "rachartier/tiny-glimmer.nvim",
  event = "VeryLazy",
  priority = 10,
  config = function()
    require("tiny-glimmer").setup({
      enabled = true,
      disable_warnings = true,
      autoreload = false,

      overwrite = {
        yank = {
          enabled = true,
          default_animation = "fade",
        },

        -- Search navigation animation
        search = {
          enabled = true,
          default_animation = "pulse",
          next_mapping = "n", -- Key for next match
          prev_mapping = "N", -- Key for previous match
        },

        -- Paste operation animation
        paste = {
          enabled = true,
          default_animation = "reverse_fade",
          paste_mapping = "p", -- Paste after cursor
          Paste_mapping = "P", -- Paste before cursor
        },

        -- Undo operation animation
        undo = {
          enabled = true,
          default_animation = {
            name = "fade",
            settings = {
              from_color = "DiffDelete",
              max_duration = 500,
              min_duration = 500,
            },
          },
          undo_mapping = "u",
        },

        -- Redo operation animation
        redo = {
          enabled = true,
          default_animation = {
            name = "fade",
            settings = {
              from_color = "DiffAdd",
              max_duration = 500,
              min_duration = 500,
            },
          },
          redo_mapping = "<c-r>",
        },
      },
    })
  end,
}

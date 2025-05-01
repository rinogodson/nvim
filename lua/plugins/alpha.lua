return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local function get_dynamic_padding()
      local header_height = #dashboard.section.header.val
      local buttons_B = #dashboard.section.buttons.val
      local buttons_S = dashboard.section.buttons.opts.spacing or 1
      local buttons_height = buttons_B + (buttons_B - 1) * buttons_S
      local footer_height = type(dashboard.section.footer.val) == "string" and 1 or #dashboard.section.footer.val
      local total_fixed_height = header_height + 2 + buttons_height + 1 + footer_height
      local window_height = vim.fn.winheight(0)
      return math.floor((window_height - total_fixed_height) / 2)
    end

    -- Set up the layout with dynamic padding
    dashboard.config = {
      layout = {
        { type = "padding", val = get_dynamic_padding },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
        { type = "padding", val = 1 },
        dashboard.section.footer,
      },
      opts = { margin = 5 },
    }

    local logo = {
      -- [[╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮]],
      -- [[│││├┤ │ │╰┐┌╯││││]],
      -- [[╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴]],
--            [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
--            [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
--            [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
--            [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
--            [[          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
--            [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
--            [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
--            [[ ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
--            [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
--            [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
--            [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],


      [[          ╭╮           ╭╮          ]],
      [[        ╭┬╮│╭─╮╭┬╮┬╶╮╭╮╷│╭╮        ]],
      [[        ╰ ╯╵╰╯╯╰┴┴╯─╯╵└┘╵╰╯        ]],
      [[        -------------------        ]],
      [[              ~neovim              ]],
    }
    dashboard.section.header.val = logo
    dashboard.section.header.opts = {
      position = "center",
      spacing = 1,
    }
    dashboard.section.buttons.val = {}
    alpha.setup(dashboard.config)
  end,
}

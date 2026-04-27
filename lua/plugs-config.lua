require("fzf-lua").setup({
  winopts = {
    title_pos = "right",
    title_flags = false,
  },
})

require("gruvbox").setup({
  contrast = "hard",
})

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "isort",
    "black",
    "pylint",
    "eslint_d",
  },
})

-- Blink.cmp configuration
require("blink.cmp").setup({
  fuzzy = { implementation = "rust" },

  sources = {
    default = { "copilot", "lsp", "path", "snippets", "buffer" },
    providers = {
      copilot = {
        name = "copilot",
        module = "blink-copilot",
        score_offset = 100,
        async = true,
      },
    },
  },

  keymap = {
    preset = "default",
    ["<Tab>"] = {
      function(cmp)
        if cmp.snippet_active() then
          return cmp.accept()
        else
          return cmp.select_and_accept()
        end
      end,
      "snippet_forward",
      "fallback",
    },
  },

  completion = {
    ghost_text = { enabled = false },
    trigger = { prefetch_on_insert = false },
    documentation = {
      auto_show = true,
      window = {
        border = "double",
      },
    },
    menu = {
      border = "single",
      auto_show = true,
      draw = {
        padding = { 0, 1 },
        columns = {
          { "label",       "label_description", gap = 1 },
          { "source_icon", "kind",              gap = 1 },
        },
        components = {

          source_icon = {
            text = function(ctx)
              local source_icons = {
                LSP = "",
                buffer = "",
                Snippets = "",
                path = "",
                copilot = "",
              }
              return source_icons[ctx.item.source_name] or ctx.item.source_name or ""
            end,
            highlight = "BlinkCmpKind",
          },
        },
      },
    },
  },

  signature = {
    enabled = true,
    window = {
      border = "single",
      winblend = 15,
    },
  },
})

vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { fg = "#b8bb26", bg = "#181b1b" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { fg = "#b8bb26", bg = "#181b1b" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { fg = "#ebdbb2", bg = "#181b1b" })
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { fg = "#ebdbb2", bg = "#181b1b" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { fg = "#fabd2f", bg = "#3C3836" })
vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = "#ebdbb2" })

-- Lualine
local background_color = "#181b1b"
local gruvbox_hard = {
  normal = {
    a = { fg = "#b8bb26", bg = background_color },
    b = { fg = "#ebdbb2", bg = background_color },
    c = { fg = "#ebdbb2", bg = background_color },
  },
  insert = {
    a = { fg = "#fabd2f", bg = background_color },
    b = { fg = "#ebdbb2", bg = background_color },
    c = { fg = "#ebdbb2", bg = background_color },
  },
  visual = {
    a = { fg = "#d3869b", bg = background_color },
    b = { fg = "#ebdbb2", bg = background_color },
    c = { fg = "#ebdbb2", bg = background_color },
  },
  replace = {
    a = { fg = "#fb4934", bg = background_color },
    b = { fg = "#ebdbb2", bg = background_color },
    c = { fg = "#ebdbb2", bg = background_color },
  },
  inactive = {
    a = { fg = "#928374", bg = background_color },
    b = { fg = "#928374", bg = background_color },
    c = { fg = "#928374", bg = background_color },
  },
}

require("lualine").setup({
  options = {
    theme = gruvbox_hard,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
    globalstatus = true,
    disabled_filetypes = { "dashboard", "alpha", "NvimTree", "Outline" },
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
    lualine_x = { "encoding" },
    lualine_y = {},
    lualine_z = {
      { "filetype", colored = true,                   icon_only = true },
      { "location", padding = { left = 0, right = 0 } },
    },
  },
  tabline = {
    lualine_b = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic", "coc" },
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
      },
    },
  },
})
-- Neo-tree
require("neo-tree").setup({
  popup_border_style = "rounded",
  window = {

    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          -- use_snacks_image = true,
          -- use_image_nvim = true,
        },
      },
    },
  },
  default_component_configs = {
    indent = {
      with_markers = true,
      indent_marker = "┇",
      last_indent_marker = "┗",
    },
    git_status = {
      symbols = {
        -- Change these if you still see boxes after installing a Nerd Font
        added = "✚",
        modified = "",
        deleted = "✖",
        renamed = "󰁕",
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
  },
})

-- tree-sitter configurations
local parsers = { "lua", "vim", "vimdoc", "typescript", "tsx", "javascript", "html", "css" }
require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local bufnr = args.buf
    local ft = vim.bo[bufnr].filetype

    local ignore_ft = { "alpha", "gitcommit", "help", "NvimTree" }
    if vim.tbl_contains(ignore_ft, ft) then
      return
    end

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    local ok, _ = pcall(vim.treesitter.start, bufnr, lang)
    if not ok then
      vim.cmd("syntax on") -- Fallback to regex highlighting if TS fails
    end
  end,
})

-- Gitsigns
require("gitsigns").setup()

-- Formatting (Conform)
require("conform").setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    svelte = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    graphql = { "prettier" },
    liquid = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 3000,
  },
})

-- Linting (nvim-lint)
require("lint").linters_by_ft = {
  markdown = { "vale" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Autopairs & Autotag
require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup()

-- UI Components
require("dressing").setup({})
require("fidget").setup({})
require("ibl").setup({
  indent = { char = "╎" },
  scope = { enabled = false },
})
require("neoscroll").setup({
  mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zz" },
  duration_multiplier = 0.2,
})

-- Flash
require("flash").setup({})

-- Mini.surround
require("mini.surround").setup({
  mappings = {
    add = "za",
    delete = "zd",
    find = "zf",
    find_left = "zF",
    highlight = "zh",
    replace = "zr",
    update_n_lines = "zn",
  },
})

-- Copilot
require("copilot").setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})

-- Language Specific
require("crates").setup()
require("flutter-tools").setup({})

-- Alpha (Dashboard)
local alpha = require("alpha")
local startify = require("alpha.themes.startify")
startify.section.header.val = {
  "╭╮╷╭─╴╭─╮╷ ╷╷╭┬╮",
  "│╰┤├╴ │ ││╭╯││││",
  "╵ ╵╰─╴╰─╯╰╯ ╵╵ ╵",
  "config by rinogodson",
}
alpha.setup(startify.config)

-- Themes setup (can be switched manually or via command)
require("kanso").setup({
  background = { dark = "zen", light = "zen" },
})
require("ayu").setup({
  mirage = false,
  terminal = true,
})
require("nordic").setup({})

-- Vai
require("vai").setup({
  trigger = "<leader>s",
})

-- Biscuits
require("nvim-biscuits").setup({
  cursor_line_only = true,
  default_config = {
    max_length = 20,
    min_distance = 5,
    prefix_string = "  ",
  },
})

-- Cellular Automaton
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

require("config.lazy")
require("keymaps")

vim.cmd("set expandtab")
vim.cmd("set nowrap")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set fillchars=eob:`")
vim.cmd("set smartindent")
vim.cmd("set autoindent")
vim.cmd("set formatoptions+=r")

vim.opt.ignorecase = true
vim.o.cmdheight = 1
vim.o.laststatus = 3
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("colorscheme kanso")

vim.opt.ignorecase = true
vim.opt.winborder = "rounded"
vim.opt.cursorline = true
vim.opt.wrap = false

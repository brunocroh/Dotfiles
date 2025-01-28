local o = vim.o
local set = vim.opt

vim.wo.wrap = false
o.guifont = "FiraCode Nerd Font:h17"
vim.blamer_enabled = 1
o.termguicolors = true
o.background = "dark"
vim.api.nvim_set_option("clipboard", "unnamed")
set.signcolumn = "yes:1"

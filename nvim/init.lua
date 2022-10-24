local set = vim.opt

set.number = true
set.relativenumber = true

set.incsearch = true
set.hlsearch = true  -- highlight search

set.modifiable = true

-- tabs
set.tabstop= 2
set.shiftwidth= 2
set.softtabstop= 2
set.expandtab = true

require('brunocroh.settings')
require('brunocroh.plugins')
require('brunocroh.keybinds')

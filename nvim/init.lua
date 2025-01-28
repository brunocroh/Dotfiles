local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local set = vim.opt

set.mouse = "a"
set.number = true
set.relativenumber = true

set.incsearch = true
set.hlsearch = true -- highlight search

set.modifiable = true

-- tabs
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

require('brunocroh.keybinds')
require('brunocroh.settings')
require('brunocroh.plugins')

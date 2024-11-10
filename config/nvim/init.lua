-- [ init.lua ] --

vim.g.mapleader = " " -- use <space> as leader
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true
vim.g.is_work = (vim.env.HOST_TYPE == "work")
require("options") -- option configuration
require("keymaps") -- keymap configuration

require("lazy-bootstrap") -- install lazy.nvim plugin manager
require("lazy-plugins") -- configure plugins with lazy

-- vim: ts=2 sts=2 sw=2 et

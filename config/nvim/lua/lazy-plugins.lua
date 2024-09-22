-- [[ lazy-plugins.lua ]] --

-- Use :Lazy to check plugin status
--  - ? for help
--  - :q to quit
-- Update plugins with :Lazy update

local plugins = {
  require 'plugins/colorschemes',     -- colorschemes

  require 'plugins/telescope',        -- fuzzy finder (and more)

  require 'plugins/treesitter',       -- better syntax highlighting and code navigation
}

local opts = {}

require('lazy').setup(plugins, opts)

vim.opt.background = 'light'
vim.cmd.colorscheme('solarized')

-- vim: ts=2 sts=2 sw=2 et

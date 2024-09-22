-- [[ solarized.lua ]] --
return {
  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    ---@type solarized.config
    opts = {},
    init = function()
      vim.opt.termguicolors = true
      vim.opt.background = 'dark'
      vim.cmd.colorscheme 'solarized'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

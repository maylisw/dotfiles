-- [[ nightfox.lua ]] --

return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 1000,            -- load this before all the other start plugins
    opts = {
      options = {
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        }
      }
    },
    init = function()
      vim.opt.termguicolors = true
      vim.opt.background = 'dark'
      -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
      vim.cmd.colorscheme('duskfox')
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

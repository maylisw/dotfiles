-- [[ nightfox.lua ]] --

return {
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,            -- load this before all the other start plugins
    init = function()
      -- nightfox, dayfox, dawnfox, duskfox, nordfox, terafox, carbonfox
      vim.cmd.colorscheme('duskfox')
    end,
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          }
        },
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

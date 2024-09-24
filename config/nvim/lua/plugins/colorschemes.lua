-- [[ colorschemes.lua ]] --

return {
	{ -- nightfox
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000, -- load this before all the other start plugins
		opts = {
			options = {
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
		},
	},
	{ -- solarized
		"maxmx03/solarized.nvim",
		lazy = false,
		priority = 1000,
		---@type solarized.config
		opts = {},
	},
}
-- vim: ts=2 sts=2 sw=2 et

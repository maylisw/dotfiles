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
		opts = {},
	},
	{ -- autoswitch modes w/ MacOS
		"cormacrelf/dark-notify",
		lazy = false,
		priority = 1000,
		config = function()
			require("dark_notify").run()
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et

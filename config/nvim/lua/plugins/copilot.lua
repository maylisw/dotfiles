-- [[ copilot.lua ]] --

return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		enabled = vim.g.is_work,
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		enabled = vim.g.is_work,
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et

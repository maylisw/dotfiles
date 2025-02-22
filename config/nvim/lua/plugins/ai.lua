-- [[ ai.lua ]] --

return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	-- cursor
	{
		"yetone/avante.nvim",
		enabled = not vim.g.is_work, -- disable for work because we need API keys
		event = "VeryLazy",
		lazy = false,
		version = "*",
		opts = {
			provider = "claude",
			claude = {
				endpoint = "http://llm-proxy-grpc.service.envoy:10080",
				model = "claude-3-5-sonnet",
				timeout = 30000,
				temperature = 0,
				max_tokens = 4096,
			},
			openai = {
				endpoint = "http://llm-proxy-grpc.service.envoy:10080",
				model = "gpt-4o",
				timeout = 30000,
				temperature = 0,
				max_tokens = 4096,
				reasoning_effort = "high", --only for the o models
			},
			behaviour = {
				auto_set_keymaps = true,
				support_paste_from_clipboard = false,
				enable_cursor_planning_mode = false, -- Whether to enable Cursor Planning Mode. Default to false.
			},
		},
		build = "make",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			-- optional deps:
			"echasnovski/mini.pick",
			"nvim-telescope/telescope.nvim",
			"hrsh7th/nvim-cmp",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
			"zbirenbaum/copilot.lua",
			{
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
					},
				},
			},
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
	-- TODO: Cody
	-- {
	-- 	"sourcegraph/sg.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },
}

-- vim: ts=2 sts=2 sw=2 et

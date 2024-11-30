-- [[ fzf.lua ]] --

return {
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("fzf-lua").setup({
				"telescope",
				fzf_colors = false,
			})
			if vim.fn.executable("fzf") ~= 1 then
				vim.notify("fzf not found. brew install fzf", vim.log.levels.WARN)
			end
		end,
		keys = {
			{ "<LEADER>fv", "<cmd>FzfLua help_tags<CR>", desc = "[F]ind [V]im help_tags" },
			{ "<LEADER>km", "<cmd>FzfLua keymaps<CR>", desc = "[K]ey[M]aps" },
			{
				"<LEADER>ff",
				function()
					require("fzf-lua").files({ cwd = vim.fn.getcwd() })
				end,
				desc = "Find files",
			},
			{ "<LEADER>fw", "<cmd>FzfLua grep<CR>", desc = "[F]ind [W]ords" },
			{ "<LEADER>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "[F]ind [D]iagnostics" },
			{ "<LEADER>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "[F]ind [S]ymbols" },
			{ "<LEADER>fb", "<cmd>FzfLua git_branches<CR>", desc = "[F]ind [B]ranches" },
			-- TODO: integrate w/ lg
			-- {
			-- 	"<LEADER>lg",
			-- 	function()
			-- 		local fzf = require("fzf-lua")
			-- 		local fzf_lg = require("extensions.fzf_live_grep")
			-- 		fzf.fzf_live(fzf_lg.search, fzf_lg.opts())
			-- 	end,
			-- 	desc = "[L]ive[G]rep",
			-- },
			{
				"<LEADER>fh",
				function()
					require("fzf-lua").oldfiles({ cwd_only = true })
				end,
				desc = "[F]ind [H]istory",
			},
			{
				"<C-p>",
				function()
					require("fzf-lua").git_files({ cwd = vim.fn.getcwd() })
				end,
				desc = "Find files in git repo",
			},
		},
	},
}

-- vim: ts=2 sts=2 sw=2 et

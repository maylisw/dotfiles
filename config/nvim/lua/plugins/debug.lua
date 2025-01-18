-- [ debug.lua ] --

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui", -- nice UI
		"nvim-neotest/nvim-nio", -- dependency of the UI
		"theHamsta/nvim-dap-virtual-text",

		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",

		-- Add your own debuggers here
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
		"suketa/nvim-dap-ruby",
	},
	keys = function(_, keys)
		local dap = require("dap")
		local dapui = require("dapui")
		return {
			{ "<leader>db", dap.toggle_breakpoint, desc = "[D]ebug: Toggle [B]reakpoint" },
			{ "<leader>dc", dap.continue, desc = "[D]ebug: Start/[C]ontinue" },
			{ "<leader>di", dap.step_into, desc = "[D]ebug: Step [I]nto" },
			{ "<leader>dv", dap.step_over, desc = "[D]ebug: Step O[v]er" },
			{ "<leader>do", dap.step_out, desc = "[D]ebug: Step [O]ut" },
			{
				"<leader>dB",
				function()
					dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "[D]ebug: Set [B]reakpoint",
			},
			{ "<leader>dr", dapui.toggle, desc = "[D]ebug: See last session [R]esult." },
			unpack(keys),
		}
	end,
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},

			ensure_installed = {
				"codelldb", -- rust
				"debugpy", -- python
				"delve", --golang
			},
		})

		dapui.setup({
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				icons = {
					pause = "⏸",
					play = "▶",
					step_into = "⏎",
					step_over = "⏭",
					step_out = "⏮",
					step_back = "b",
					run_last = "▶▶",
					terminate = "⏹",
					disconnect = "⏏",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- setup language specific DAPs
		require("dap-go").setup({
			delve = {
				detached = vim.fn.has("win32") == 0,
			},
		})
		require("dap-python").setup("python")
		require("dap-ruby").setup()
		require("nvim-dap-virtual-text").setup()
	end,
}
-- vim: ts=2 sts=2 sw=2 et

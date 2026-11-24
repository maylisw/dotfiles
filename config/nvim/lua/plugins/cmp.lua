-- [[ cmp.lua ]] --

return {
	{ -- Autocompletion
		"saghen/blink.cmp",
		version = "1.*",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"rafamadriz/friendly-snippets",
			"fang2hou/blink-copilot",
		},
		opts = {

			keymap = {
				preset = "none",
				["<C-n>"] = { "select_next", "fallback" }, -- Select the [n]ext item
				["<C-p>"] = { "select_prev", "fallback" }, -- Select the [p]revious item
				["<C-b>"] = { "scroll_documentation_up", "fallback" }, -- Scroll the documentation window [b]ack / [f]orward
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-y>"] = { "select_and_accept" }, -- Accept ([y]es) the completion
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" }, -- Manually trigger a completion
				["<C-e>"] = { "hide", "fallback" },
				-- Think of <c-l> as moving to the right of your snippet expansion.
				-- <c-h> is similar, except moving you backwards.
				["<C-l>"] = { "snippet_forward", "fallback" },
				["<C-h>"] = { "snippet_backward", "fallback" },
			},

			completion = {
				list = { selection = { preselect = false, auto_insert = true } },
				documentation = { auto_show = true },
			},

			sources = {
				default = { "lazydev", "lsp", "snippets", "path", "buffer", "copilot" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- make lazydev completions top priority
					},
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
					},
				},
			},

			cmdline = {
				keymap = {
					preset = "none",
					["<C-n>"] = { "select_next", "fallback" },
					["<C-p>"] = { "select_prev", "fallback" },
					["<C-y>"] = { "select_and_accept" },
					["<C-e>"] = { "hide", "fallback" },
					["<Tab>"] = { "show_and_insert_or_accept_single", "select_next" },
					["<S-Tab>"] = { "select_prev" },
				},
				completion = { menu = { auto_show = true } },
			},
		},
	},
}
-- vim: ts=2 sts=2 sw=2 et

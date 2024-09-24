-- [[ treesitter.lua ]] --
return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs", -- Sets main module to use for opts
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			},
			auto_install = true, -- autoinstall missing languages
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" }, -- ruby depends on vim's regex highlighting system for index rules
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		--  Modules to check out
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
}
-- vim: ts=2 sts=2 sw=2 et

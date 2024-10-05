-- [[ lazy-plugins.lua ]] --

-- Use :Lazy to check plugin status
--  - ? for help
--  - :q to quit
-- Update plugins with :Lazy update

local plugins = {
	require("plugins/colorschemes"), -- colorschemes

	require("plugins/telescope"), -- fuzzy finder (and more)

	require("plugins/treesitter"), -- better syntax highlighting and code navigation

	require("plugins/neo-tree"), -- file finder

	require("plugins/lspconfig"), -- lsp

	require("plugins/cmp"), -- autocompletion

	require("plugins/autopairs"), -- autopair parens, braces, quotes, etc..

	require("plugins/conform"), -- autoformat

	require("plugins/nvim-lint"), -- linting

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	require("plugins/todo-comments"), -- todo comments

	require("plugins/mini"), -- collection of small plugins

	require("plugins/which-key"), -- shows pending keybindings
}

local opts = {}

require("lazy").setup(plugins, opts)

vim.opt.background = "light"
vim.cmd.colorscheme("dawnfox")

-- vim: ts=2 sts=2 sw=2 et

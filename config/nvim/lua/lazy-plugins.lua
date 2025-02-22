-- [[ lazy-plugins.lua ]] --

-- Use :Lazy to check plugin status
--  - ? for help
--  - :q to quit
-- Update plugins with :Lazy update

local plugins = {
	-- [ File Exploration ] --
	require("plugins/telescope"), -- fuzzy finder (and more)

	require("plugins/fzf"), -- fuzzy finder (better in large repos)

	require("plugins/oil"), -- filesytem editor

	-- [ Programming ] --
	require("plugins/treesitter"), -- better syntax highlighting and code navigation

	require("plugins/lspconfig"), -- lsp

	require("plugins/lint"), -- linting and formatting

	require("plugins/ai"), -- AI

	require("plugins/cmp"), -- autocompletion

	require("plugins/debug"), -- debug setups

	require("plugins/vim-test"), -- integration with test frameworks

	require("plugins/autopairs"), -- autopair parens, braces, quotes, etc..

	-- [ UI ] --
	require("plugins/colorschemes"),

	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically

	require("plugins/todo-comments"), -- todo comments

	require("plugins/mini"), -- collection of small plugins (status bar!)

	require("plugins/which-key"), -- shows pending keybindings

	require("plugins/git"), -- git configurations in editor

	require("plugins/tmux-navigator"), -- better window integration with tmux
}

local opts = {}
require("lazy").setup(plugins, opts)

vim.cmd.colorscheme("dawnfox")

-- vim: ts=2 sts=2 sw=2 et

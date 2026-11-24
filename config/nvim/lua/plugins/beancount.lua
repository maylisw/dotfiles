-- [ beancount.lua ] --

return {
	"hxueh/beancount.nvim",
	cond = not vim.g.is_work, -- only load on personal computers
	ft = { "beancount", "bean" },
	opts = {
		python_path = "/Users/maylisw/Library/Application Support/pipx/venvs/beancount/bin/python",
		main_bean_file = "/Users/maylisw/beancount-finances/ledger.bean",
	},
}
-- vim: ts=2 sts=2 sw=2 et

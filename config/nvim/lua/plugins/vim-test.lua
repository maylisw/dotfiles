-- [ vim-test.lua ] --

return {
	{
		"vim-test/vim-test",
		dependencies = {
			"preservim/vimux",
		},
		vim.keymap.set("n", "<leader>t", ":TestNearest<CR>"),
		vim.keymap.set("n", "<leader>T", ":TestFile<CR>"),
		vim.keymap.set("n", "<leader>a", ":TestSuite<CR>"),
		vim.keymap.set("n", "<leader>l", ":TestLast<CR>"),
		vim.keymap.set("n", "<leader>g", ":TestVisit<CR>"),

		vim.cmd("let test#strategy = 'vimux'"), -- run test in tmux pane
	},
}
-- vim: ts=2 sts=2 sw=2 et

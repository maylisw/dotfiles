-- [[ keymaps.lua ]] ---

-- Use ESC in normal mode to clear search highlighting
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Better scrolling with zz
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better searching with zz
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Navigate buffers with <leader>b{n,p,d}
vim.keymap.set("n", "<leader>n", '":<c-u>" .. v:count1 .. "bnext<CR>"', { expr = true })
vim.keymap.set("n", "<leader>p", '":<c-u>" .. v:count1 .. "bprev<CR>"', { expr = true })
vim.keymap.set("n", "<leader>bd", '":<c-u>" .. v:count1 .. "bdel<CR>"', { expr = true })

-- Use leader p to delete under selection in visual mode and paste w/o affecting current registers
vim.keymap.set("x", "<leader>p", '"_dP')

------ Diagnostics ------
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uick fix list" })

------ Terminal ------
-- Use ESC+ESC to exit terminal job mode and go to normal mode
-- disabled since it won't work with all terminals, use <C-w>N instead
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

------ Window navigation ------
-- Use CTRL+<hjkl> to navigate instead of <CTRL-w>+<CTRL-<hjkl>>
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

------ Autocomands ------
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	desc = "Update tmux colorscheme when vim colorscheme changes",
	group = vim.api.nvim_create_augroup("colorscheme-update", { clear = true }),
	callback = function()
		local colorscheme = vim.g.colors_name
		vim.cmd(string.format("silent !tmux source-file ~/.tmux/%s.tmux", colorscheme))
	end,
})

vim.api.nvim_create_autocmd("OptionSet", {
	desc = "Update colorscheme on background change",
	group = vim.api.nvim_create_augroup("background-mode-update", { clear = true }),
	pattern = "background",
	callback = function()
		local colorscheme = vim.g.colors_name
		if colorscheme ~= "solarized" then
			-- TODO: Make this depend on the current theme
			-- if colorscheme == "dawnfox" or colorscheme == "duskfox" then
			-- does not work bc colorscheme is sometimes nil
			local risingfox = {
				light = "dawnfox",
				dark = "duskfox",
			}
			colorscheme = risingfox[vim.o.background]
			vim.cmd.colorscheme(colorscheme)
			vim.cmd(string.format("silent !tmux source-file ~/.tmux/%s.tmux", colorscheme))
		end
	end,
})

-- vim: ts=2 sts=2 sw=2 et

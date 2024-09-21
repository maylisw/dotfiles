-- [[ options.lua ]] ---

--- numbers ---
vim.opt.number = true               -- line numbers
vim.opt.relativenumber = true       -- show relative line numbers
vim.opt.signcolumn = 'number'       -- use number column to display signs

--- mouse ---
vim.opt.mouse = 'a'                 -- enable mouse

--- cursor ---
vim.opt.scrolloff = 5               -- keep at least 5 lines +/- cursor on screen
vim.opt.cursorline = true           -- highlight cursor line
vim.opt.cursorlineopt = 'number'    -- but just in the number column

--- status line ---
vim.opt.showmode = false            -- don't show mode (already in status line)
vim.opt.ruler = true                -- show cursor position in status line
vim.opt.showcmd = true              -- display incomplete commands

--- substitutions ---
vim.opt.inccommand = 'split'        -- show off-screen substitutions too

--- line breaks ---
vim.opt.breakindent = true          -- keep indent for wrapped lines 
vim.opt.linebreak = true            -- wrap lines at a 'word' boundary

--- splits ---
vim.opt.splitright = true           -- vsplit opens right of current window
vim.opt.splitbelow = true           -- split opens below current window

--- search ---
vim.opt.hlsearch = true             -- highlight search results
vim.opt.incsearch = true            -- do incremental searching
vim.opt.ignorecase = true           -- case-insensitive search...
vim.opt.smartcase = true            -- unless there are capital letters

--- timing ---
vim.opt.updatetime = 750            -- used by a lot of plugins for when to refresh
vim.opt.timeoutlen = 300            -- decrease mapped sequence wait-time

--- history ---
vim.opt.history = 1000              -- keep 1000 lines of command history
vim.opt.undofile = true             -- save undo history

--- clipboard ---
vim.schedule(function()             -- schedule after 'UiEnter' for faster startup
  vim.opt.clipboard = 'unnamedplus' -- sync with OS clipboard
end)

--- tab size ---
vim.opt.expandtab = true            -- expand tabs to spaces
vim.opt.tabstop = 4                 -- hard tab = 4 spaces
vim.opt.softtabstop = 4             -- soft tab = 4 spaces
vim.opt.shiftwidth = 4              -- beginning of the line tab = 4 spaces

--- whitespace display ---
vim.opt.list = true                 -- display whitespace
vim.opt.listchars = {
    tab = '→ ',                     -- hard tab
    trail = '·',                    -- trailing whitespace
    nbsp = '␣'                      -- non-breakable space
}


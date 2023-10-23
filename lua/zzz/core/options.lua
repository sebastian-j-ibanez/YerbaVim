-----------------
--   Options   --
-----------------

-- UI
vim.opt.termguicolors=true
vim.opt.number=true			-- Shows line numbers
vim.opt.showmatch=true 		-- Highlights matching brace pairs
vim.opt.cursorline = true	-- Highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true   -- open new vertical split bottom
vim.opt.splitright = true   -- open new horizontal splits right

-- Netrw
vim.g.netrw_liststyle=3     -- Set netrw to tree view

-- Tab
vim.opt.tabstop=4			-- Sets number of spaces a tab uses
vim.opt.softtabstop=4		-- Number of spacesin tab when editing
vim.opt.shiftwidth=4        -- Insert 4 spaces on a tab
vim.opt.expandtab=true      -- Tabs are spaces, mainly because of python


------------------
-- Key bindings --
------------------
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader=" "

-- AGGRESSIVE INDENTING
map('n', '<Tab>', '==', opts)
map('v', '<Tab>', '=', opts)

-- WINDOW NAVIGATION
map('t', '<A-h>', '<C-\\><C-n><C-w>h', opts)
map('t', '<A-j>', '<C-\\><C-n><C-w>j', opts)
map('t', '<A-k>', '<C-\\><C-n><C-w>k', opts)
map('t', '<A-l>', '<C-\\><C-n><C-w>l', opts)

map('i', '<A-h>', '<C-\\><C-n><C-w>h', opts)
map('i', '<A-j>', '<C-\\><C-n><C-w>j', opts)
map('i', '<A-k>', '<C-\\><C-n><C-w>k', opts)
map('i', '<A-l>', '<C-\\><C-n><C-w>l', opts)

map('n', '<A-h>', '<C-w>h', opts)
map('n', '<A-j>', '<C-w>j', opts)
map('n', '<A-k>', '<C-w>k', opts)
map('n', '<A-l>', '<C-w>l', opts)

-- TELESCOPE
map('n', '<leader>fd', ":Telescope lsp_document_symbols<CR>", {silent = true})
map('n', '<leader>ff', ":Telescope find_files<CR>", { silent = true })
map('n', '<leader>fg', ":Telescope live_grep<CR>", { silent = true })
map('n', '<leader>fb', ":Telescope buffers<CR>", { silent = true })
map('n', '<leader>fh', ":Telescope help_tags<CR>", { silent = true })

-- CUSTOM BUFFERS
local buffers = require('zzz.core.buffers')
map('n', '<leader>e', buffers.ToggleFileExplorer, { desc = 'Toggle file explorer', unpack(opts) })
map('n', '<leader>t', buffers.ToggleTerminal, { desc = 'Toggle terminal', unpack(opts) })

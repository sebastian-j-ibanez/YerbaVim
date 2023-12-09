------------------
-- Key bindings --
------------------
vim.g.mapleader=" "

-- TOGGLE NETRW SIDEBAR
local nw = {}

function ToggleVExplorer()
    if nw.expl_buf_num then
        local expl_win_num = vim.fn.bufwinnr(nw.expl_buf_num)
        local cur_win_num = vim.fn.winnr()

        if expl_win_num ~= -1 then
            while expl_win_num ~= cur_win_num do
                vim.cmd('wincmd w')
                cur_win_num = vim.fn.winnr()
            end
            vim.cmd('close')
        end

        nw.expl_buf_num = nil
    else
        vim.cmd('Vexplore')
        nw.expl_buf_num = vim.fn.bufnr('%')
    end
end

-- Map <leader>e to call ToggleVExplorer
vim.keymap.set('n', '<leader>e', ':lua ToggleVExplorer()<CR>', { silent = true })

-- TOGGLE TERMINAL
local tw = {}

function ToggleTerm()
    if tw.expl_buf_num then
        local expl_win_num = vim.fn.bufwinnr(tw.expl_buf_num)
        local cur_win_num = vim.fn.winnr()

        if expl_win_num ~= -1 then
            while expl_win_num ~= cur_win_num do
                vim.cmd('wincmd w')
                cur_win_num = vim.fn.winnr()
            end
            vim.cmd('close')
        end

        tw.expl_buf_num = nil
    else
        vim.cmd('split')
        vim.cmd('terminal')
        vim.cmd('res 20_')
        tw.expl_buf_num = vim.fn.bufnr('%')
    end
end

-- Map <leader>t to call ToggleTerm
vim.keymap.set('n', '<leader>t', ':lua ToggleTerm()<CR>', { silent = true })

-- WINDOW NAVIGATION
vim.api.nvim_set_keymap('t', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('i', '<A-h>', '<C-\\><C-n><C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-j>', '<C-\\><C-n><C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-k>', '<C-\\><C-n><C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<A-l>', '<C-\\><C-n><C-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- TELESCOPE
vim.keymap.set('n', '<leader>fd', ":Telescope lsp_document_symbols<CR>", {silent = true})
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { silent = true })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", { silent = true })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", { silent = true })

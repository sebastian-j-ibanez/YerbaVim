------------------
-- Key bindings --
------------------
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
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
vim.keymap.set('n', '<leader>fd', ":Telescope lsp_document_symbols<CR>", {silent = true})
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", { silent = true })
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", { silent = true })
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", { silent = true })
vim.keymap.set('n', '<leader>fh', ":Telescope help_tags<CR>", { silent = true })

-- BARBAR
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

------------------
-- Key bindings --
------------------
vim.g.mapleader=" "

-- TOGGLE NETRW SIDEBAR
-- Store the buffer number of Vexplore
local t = {}

-- Function to toggle Vexplore with Ctrl-O
function ToggleVExplorer()
    if t.expl_buf_num then
        local expl_win_num = vim.fn.bufwinnr(t.expl_buf_num)
        local cur_win_num = vim.fn.winnr()

        if expl_win_num ~= -1 then
            while expl_win_num ~= cur_win_num do
                vim.cmd('wincmd w')
                cur_win_num = vim.fn.winnr()
            end
            vim.cmd('close')
        end

        t.expl_buf_num = nil
    else
        vim.cmd('Vexplore')
        t.expl_buf_num = vim.fn.bufnr('%')
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

vim.keymap.set('n', '<leader>t', ':lua ToggleTerm()<CR>', { silent = true })

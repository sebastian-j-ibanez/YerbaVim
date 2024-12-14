local BufFn = {}

-- TOGGLE NETRW SIDEBAR
local nw = {}

function BufFn.ToggleFileExplorer()
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

-- TOGGLE TERMINAL
local tw = {}

function BufFn.ToggleTerminal()
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

return BufFn

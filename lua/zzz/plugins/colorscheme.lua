return {
    -- Poimandres
    {
        'olivercederborg/poimandres.nvim',
        config = function()
            require('poimandres').setup { }
        end,
    },
    -- Rasmus
    {
        'kvrohit/rasmus.nvim',
        config = function()
            vim.g.rasmus_bold_functions = true
        end,
    },
    -- Skull
    {
        'kxzk/skull-vim',
    },
}


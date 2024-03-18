return {
    --Evergarden
    {
        'comfysage/evergarden',
        opts = {
            transparent_background = false,
            contrast_dark = 'medium', -- 'hard'|'medium'|'soft'
            overrides = { }, -- add custom overrides
        }
    },
    --Nord
    {
        "shaunsingh/nord.nvim",
        config = function()
            vim.g.nord_borders = true
            vim.g.nord_italic = false
            vim.g.nord_cursorline_transparent = true
            require('nord').set()
        end,
    },
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
    },
    -- Skull
    {
        'kxzk/skull-vim',
    },
    -- VS Code
    {
        "askfiy/visual_studio_code",
    },
}


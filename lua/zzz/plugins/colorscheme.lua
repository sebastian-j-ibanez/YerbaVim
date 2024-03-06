return {
    -- Nightfox
    {
        "EdenEast/nightfox.nvim",
    },
    -- Poimandres
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup { }
        end,
    },
    -- Tokyonight
    {
        "folke/tokyonight.nvim",
        --lazy = false,
        --priority = 1000,
    },
    -- VS Code
    {
        "askfiy/visual_studio_code",
    },
}


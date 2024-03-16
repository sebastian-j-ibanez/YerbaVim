return {
    -- Nightfox
    {
        "EdenEast/nightfox.nvim",
    },
    --Nord
    {
        "shaunsingh/nord.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_borders = true
            vim.g.nord_disable_background = true
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


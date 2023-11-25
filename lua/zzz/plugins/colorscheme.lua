return {
    -- Bamboo
    {
        'ribru17/bamboo.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('bamboo').setup {
                style='multiplex',
                toggle_style_key="<leader>ts",
                toggle_style_list = { 'vulgaris', 'multiplex', 'light' },
            }
            require('bamboo').load()
        end,
    },
    -- Matrix
    {
        "luisiacc/the-matrix.nvim",
    },
    -- Nightfox
    {
        "EdenEast/nightfox.nvim",
    },
    -- Oxocarbon 
    {
        "nyoom-engineering/oxocarbon.nvim",
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


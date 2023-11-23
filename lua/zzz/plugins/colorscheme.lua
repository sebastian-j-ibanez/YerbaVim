return {
    -- Nightfox
    {
        "EdenEast/nightfox.nvim",
    },
    
    -- VS Code
    {
        "askfiy/visual_studio_code",
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
}


return {
    -- Miasma
    {
        "xero/miasma.nvim",
        branch = "dev",
        dependencies = {
            "rktjmp/lush.nvim",
            "rktjmp/shipwright.nvim",
        },
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme miasma")
        end,
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


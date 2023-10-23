return {
    {
        "EdenEast/nightfox.nvim",
    },

    {
        "Shatur/neovim-ayu",
    },

    {
        "nyoom-engineering/oxocarbon.nvim",
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme oxocarbon]])
        end,
    },
}


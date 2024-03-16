return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
        require('lualine').setup {
            theme = 'nordic'
        }
    end,
}

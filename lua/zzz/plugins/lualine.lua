return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                icons_enables = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
            },
        }
    end,
}

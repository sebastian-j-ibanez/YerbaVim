return {
    -- using lazy.nvim
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    keys = {
        { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
        { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
            mode = 'tabs',
            show_buffer_close_icods = false,
            show_close_icon = false,
    },
    config = function()
        vim.opt.termguicolors = true
        require('bufferline').setup ({
            options = {
                seperator_style = 'thin',
            },
        })
    end
}

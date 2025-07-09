return {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                require('hover.providers.dap')
            end,
            preview_opts = {
                border = "single"
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = true,
            title = true,
            mouse_providers = {
                "LSP"
            },
            mouse_delay = 800
        }

        -- Setup keymaps
        vim.keymap.set("n", "<leader>k", require("hover").hover, {desc = "hover.nvim"})

        -- Mouse support
        vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
        vim.o.mousemoveevent = true
    end,
}

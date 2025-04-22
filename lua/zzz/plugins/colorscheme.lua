return {
    {
        "Mofiqul/vscode.nvim",
        lazy = false
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000
    },
    {
        'NTBBloodbath/doom-one.nvim',
            lazy = false,
            priority = 1000,
            setup = function()
                -- Add color to cursor
        		vim.g.doom_one_cursor_coloring = false
        		-- Set :terminal colors
        		vim.g.doom_one_terminal_colors = true
        		-- Enable TS support
        		vim.g.doom_one_enable_treesitter = true
        		-- Color whole diagnostic text or only underline
                vim.g.doom_one_diagnostics_text_color = false
        		-- Enable transparent background
        		vim.g.doom_one_transparent_background = true
                -- Plugins integration
        		vim.g.doom_one_plugin_neorg = true
        		vim.g.doom_one_plugin_barbar = true
        		vim.g.doom_one_plugin_telescope = false
        		vim.g.doom_one_plugin_neogit = true
        		vim.g.doom_one_plugin_nvim_tree = true
        		vim.g.doom_one_plugin_dashboard = true
        		vim.g.doom_one_plugin_whichkey = true
        	end,
    }
}


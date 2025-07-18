return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            defaults = {
                layout_strategy = 'horizontal',
                sorting_strategy = 'ascending',
                file_ignore_patterns = {
                    ".git",
                    "target",
                    ".idea",
                    ".vscode",
                    "node_modules",
                    ".venv"
                }
            },
        },
    },
}

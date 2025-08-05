return {
    {
        "miikanissi/modus-themes.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("modus-themes").setup({
                styles = {
                    comments = { italic = false},
                    keywords = { italic = false},
                    functions = { italic = false },
                    variables = { italic = false },
                },
            })
        end
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github-theme'
    }
}


return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "c",
                "cpp",
                "go",
                "haskell",
                "html",
                "javascript",
                "lua",
                "ocaml",
                "python",
                "rust",
                "swift",
            },
            sync_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}

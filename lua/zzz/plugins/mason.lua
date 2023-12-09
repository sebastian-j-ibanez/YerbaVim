return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        mason_lspconfig.setup({
            -- list of servers to automatically install
            ensure_installed = {
                "clangd",
                "cmake",
                "omnisharp",
                "golangci_lint_ls",
                "html",
                "cssls",
                "lua_ls",
                "jsonls"
            },
            automatic_installation = true,
        })
        -- Setup installed servers
        mason_lspconfig.setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup {}
            end,
            -- Lua server config
            ["lua_ls"] = function ()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" }
                            }
                        }
                    }
                }
            end,
        })
    end,
}

return {
    -- Mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    -- Mason LSP Config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {
                    "clangd",
                    "gopls",
                    "pylsp",
                    "rust_analyzer",
                    "lua_ls",
                },
                automatic_installation = true,
            })

            -- Setup lspconfig
            local lspconfig = require("lspconfig")
            local map = vim.keymap.set
            local opts = { noremap = true, silent = true }
            local on_attach = function(_, bufnr)
                opts.buffer = bufnr

                opts.desc = "Show references"
                map("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts)

                opts.desc = "Show definitions"
                map("n", "<leader>gD", "<cmd>Telescope lsp_definitions<CR>", opts)

                opts.desc = "Show type definitions"
                map("n", "<leader>gd", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                opts.desc = "Show implementations"
                map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                opts.desc = "Show type definitions"
                map("n", "<leader>gt", "", opts)

                opts.desc = "Rename"
                map("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts.desc = "Show documentation"
                map("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Show line diagnostics"
                map("n", "<leader>d", vim.diagnostic.open_float, opts)

                opts.desc = "Go to previous diagnostic"
                map("n", "[d", vim.diagnostic.goto_prev, opts)

                opts.desc = "Go to next diagnostic"
                map("n", "]d", vim.diagnostic.goto_next, opts)
            end

            -- Add on_attach function to every LSP
            mason_lspconfig.setup_handlers({
                function(server_name)
                    lspconfig[server_name].setup({
                        on_attach = on_attach,
                    })

                    -- Add vim/nvim namespace to lua_ls
                    lspconfig["lua_ls"].setup({
                        on_attach = on_attach,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    }
                                }
                            }
                        }
                    })
                end,
            })
        end
    }
}

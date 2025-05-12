-- Inspired by the Mason configuration in kickstart.nvim
-- kickstart.nvim and YerbaVim are distributed under the MIT license
-- https://github.com/nvim-lua/kickstart.nvim
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
                        package_installed = "|>",
                        package_pending = "=>",
                        package_uninstalled = "---"
                    }
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function ()
            -- LspAttach is run whenever a buffer is opened that is associated with an LSP
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
                callback = function(event)
                    -- Helper function for keymaps
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    map("<leader>gr", vim.lsp.buf.references, "Show references")
                    map("<leader>gD", vim.lsp.buf.definition, "Show definitions")
                    map("<leader>gd", vim.lsp.buf.type_definition, "Show type definitions")
                    map("<leader>gi", vim.lsp.buf.implementation, "Show implementations")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("K", vim.lsp.buf.hover, "Show documentation")
                    map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
                    map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
                    map("<leader>la", vim.lsp.buf.code_action, "Code Action", { "n", "v" })
                end,
            })

            local servers = {
                gopls = {},
                rust_analyzer = {},
                pylsp = {},
                lua_ls = {
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
                },
            }

            -- Setup LSP servers
            local mason_lspconfig = require("mason-lspconfig")
            mason_lspconfig.setup({
                ensure_installed = {},
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        local server = servers[server_name] or {}
                        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
                        require("lspconfig")[server_name].setup(server)
                    end,
                },
            })
        end
    },
}

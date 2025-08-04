-- Inspired by Mason configurations from:
-- https://kosu.me/
-- kickstart.nvim
return {
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "󰦗",
                        package_uninstalled = ""
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
            "hrsh7th/cmp-nvim-lsp"
        },
        config = function()
            require("mason").setup()

            -- Setup LSP servers
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "gopls",
                    "rust_analyzer",
                    "pylsp",
                    "ts_ls",
                    "vue_ls"
                },
                automatic_installation = true
            })

            -- Generic config
            vim.lsp.config('*', {})

            -- Lua config
            vim.lsp.config('lua_ls', {
                settings = {
                    Lua = {
                        runtime = { version = 'Lua 5.1' },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
            })

            require("lspconfig").ts_ls.setup({
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
            })

            require("lspconfig").volar.setup({
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
            })

            -- Typescript
            local vue_ls_path = vim.fn.expand("$MASON/packages/vue-language-server")
            local vue_plugin_path = vue_ls_path .. "/node_modules/@vue/language-server"
            vim.lsp.config('vue_ls', {
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = vue_plugin_path,
                            languages = { "vue" },
                        },
                    },
                },
                filetypes = { "typescript", "javascript", "vue" },
            })

            -- Map LSP keybindings when an LSP server is attached.
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end
                    map("<leader>gr", vim.lsp.buf.references, "Show references")
                    map("<leader>gd", vim.lsp.buf.definition, "Show definitions")
                    map("<leader>gD", vim.lsp.buf.type_definition, "Show type definitions")
                    map("<leader>gi", vim.lsp.buf.implementation, "Show implementations")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("K", vim.lsp.buf.hover, "Show documentation")
                    map("<leader>d", vim.diagnostic.open_float, "Show line diagnostics")
                    map("[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")
                    map("]d", vim.diagnostic.goto_next, "Go to next diagnostic")
                end,
            })
        end,
    },
}

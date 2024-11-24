return {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        animation = true,
        auto_hide = 0,
        tabpages = true,
        clickable = true,
        focus_on_close = 'right',
        highlight_alternate = true,
        highlight_inactive_file_icons = true,
        highlight_visible = true,
        separator = {left = '|', right = ''},
        icons = {
           -- Enables / disables diagnostic symbols
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
                [vim.diagnostic.severity.WARN] = {enabled = false},
                [vim.diagnostic.severity.INFO] = {enabled = false},
                [vim.diagnostic.severity.HINT] = {enabled = true},
            },
        },
        gitsigns = {
            added = {enabled = true, icon = '+'},
            changed = {enabled = true, icon = '~'},
            deleted = {enabled = true, icon = '-'},
        },
    },
    version = '^1.0.0',
}

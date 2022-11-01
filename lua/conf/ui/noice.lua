-- https://github.com/folke/noice.nvim

require("noice").setup({
    messages = {
        enabled = true, -- enables the Noice messages UI
        view = "mini", -- default view for messages
        view_error = false, -- view for errors
    },
    health = {
        checker = false, -- Disable if you don't want health checks to run
    },
    views = {
        cmdline_popup = {
            border = {
                style = "rounded",
            },
            filter_options = {},
            win_options = {},
        },
        input = {
            border = {
                style = "rounded",
            },
            win_options = {},
        }
    },
    lsp = {
        progress = {
            format = {
                { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
                { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
                { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                { "{data.progress.message} ", hl_group = "NoiceLspProgressTitle" },
                "{data.progress.percentage}% ",
            },
            format_done = {
                { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
                { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                { "✔ ", hl_group = "NoiceLspProgressSpinner" },
            },
        }
    }
})

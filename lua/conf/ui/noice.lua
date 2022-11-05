-- https://github.com/folke/noice.nvim

require("noice").setup({
    messages = {
        view = "mini",
        view_error = "mini",
        view_warn = "mini",
        view_history = "mini",
    },
    notify = {
        view = "mini",
    },
    health = {
        checker = false, -- Disable if you don't want health checks to run
    },
    views = {
        mini = {
            win_options = {
                winblend = 0,
            },
        }
    },
    lsp = {
        message = {
            view = "mini",
        },
        progress = {
            format = {
                { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
                "{data.progress.percentage}% ",
                { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                { "{data.progress.message} ", hl_group = "NoiceLspProgressTitle" },
                { "{data.progress.client}", hl_group = "NoiceLspProgressClient" },
            },
            format_done = {
                { "✔ ", hl_group = "NoiceLspProgressSpinner" },
                { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                { "{data.progress.client}", hl_group = "NoiceLspProgressClient" },
            },
        }
    }
})

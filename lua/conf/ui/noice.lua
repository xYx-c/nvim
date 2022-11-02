-- https://github.com/folke/noice.nvim

require("noice").setup({
    messages = {
        view = "mini", -- default view for messages
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

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
})

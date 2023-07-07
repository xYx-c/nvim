-- https://github.com/folke/noice.nvim

require("noice").setup({
    messages = {
        view = "mini",
    },
    health = {
        checker = false, -- Disable if you don't want health checks to run
    },
    views = {
        -- mini = {
        --     win_options = {
        --         winblend = 99,
        --     },
        -- },
    },
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
        message = {
            view = "mini",
        },
        progress = {
            -- enabled = false,
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
        },
        signature = {
            auto_open = {
                trigger = false,
            }
        }
    },
    presets = {
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },
})

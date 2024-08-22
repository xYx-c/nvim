-- https://github.com/stevearc/conform.nvim

local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        -- python = { "black" },
    }
})

conform.formatters.prettierd = {
    prepend_args = {
        "--print-width=120",
        "--single-quote=true",
        "--trailing-comma=all",
        "--arrow-parens=avoid",
        "--bracket-spacing=true",
        "--end-of-line=auto",
        "--semi=true",
        "--tab-width=2",
        "--use-tabs=false"
    }
}

vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    conform.format({ async = true, lsp_format = "fallback" ,range = range })
end, { range = true })

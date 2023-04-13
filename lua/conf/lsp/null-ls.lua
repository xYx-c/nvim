-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_args = {
                "--print-width=120",
                "--single-quote=true",
                "--trailing-comma=all",
                "--arrow-parens=avoid",
                "--bracket-spacing=true",
                "--end-of-line=auto",
                "--semi=true",
                "--tab-width=2",
                "--use-tabs=false"
            },
        }),
        -- null_ls.builtins.formatting.sql_formatter,
        -- null_ls.builtins.diagnostics.sqlfluff.with({
        --     extra_args = { "--dialect", "postgres" }, -- change to your dialect
        -- }),
        null_ls.builtins.formatting.clang_format.with({
            extra_args = { "--style=Google", "--indent-width=4", "--tab-width=4" },
        }),
    },
})

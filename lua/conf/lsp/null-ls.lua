-- https://github.com/jose-elias-alvarez/null-ls.nvim

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd.with({
            env = {
                PRETTIERD_DEFAULT_CONFIG = {
                    printWidth = 120,
                    singleQuote = true,
                    trailingComma = "all",
                    arrowParens = "avoid",
                    bracketSpacing = true,
                    endOfLine = "auto",
                    semi = true,
                    tabWidth = 2,
                    useTabs = false,
                }
            }
        }),
        null_ls.builtins.formatting.sql_formatter,
    },
})

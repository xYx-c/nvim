-- https://github.com/ray-x/go.nvim
-- https://github.com/crispgm/nvim-go

local opts = {
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable()
    end,
    settings = {
        gopls = {
            hints = {
                rangeVariableTypes = true,
                parameterNames = true,
                constantValues = true,
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                functionTypeParameters = true,
            },
        },
    }
}

return opts

-- https://github.com/ray-x/go.nvim
-- https://github.com/crispgm/nvim-go

-- require('go').setup({
--     gopls_cmd = { vim.env.HOME .. '/.local/share/nvim/mason/bin/' .. 'gopls' },
--     fillstruct = 'gopls',
--     dap_debug = true,
--     dap_debug_gui = true,
-- })

local opts = {
    -- on_attach = function(client, bufnr)
    --     require("lsp-inlayhints").on_attach(client, bufnr)
    -- end,
    settings = {
        hints = {
            rangeVariableTypes = true,
            parameterNames = true,
            constantValues = true,
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            functionTypeParameters = true,
        },
    }
}

return opts

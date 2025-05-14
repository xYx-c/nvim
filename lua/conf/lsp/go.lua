-- https://github.com/ray-x/go.nvim
-- https://github.com/crispgm/nvim-go

-- require('go').setup({
--     gopls_cmd = { vim.env.HOME .. '/.local/share/nvim/mason/bin/' .. 'gopls' },
--     fillstruct = 'gopls',
--     dap_debug = true,
--     dap_debug_gui = true,
-- })

local opts = {
    on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable()
        require("inlay-hints").on_attach(client, bufnr)
    end,
    -- settings = {
    --     gopls = {
    --         hints = {
    --             rangeVariableTypes = true,
    --             parameterNames = true,
    --             constantValues = true,
    --             assignVariableTypes = true,
    --             compositeLiteralFields = true,
    --             compositeLiteralTypes = true,
    --             functionTypeParameters = true,
    --         },
    --     },
    -- }
}

return opts

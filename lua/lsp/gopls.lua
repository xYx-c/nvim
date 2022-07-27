local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    on_attach = require('keybinds').on_attach,
    capabilities = capabilities,
    -- cmd = { vim.env.HOME, '/.local/share/nvim/lsp_servers/go/gopls' }
}

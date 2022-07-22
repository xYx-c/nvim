-- https://github.com/simrat39/rust-tools.nvim

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local config = {
    on_attach = require('keybinds').on_attach,
    capabilities = capabilities
}

return config

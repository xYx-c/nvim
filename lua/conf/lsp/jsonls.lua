local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local opts = {
    filetypes = { "json", "jsonc" },
    capabilities = capabilities,
}

return opts

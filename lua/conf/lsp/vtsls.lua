local vue_language_server_path = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")

return {
    on_attach = function(client, bufnr)
        -- vim.lsp.inlay_hint.enable()
        vim.diagnostic.config({
            underline = {
                severity = {
                    min = vim.diagnostic.severity.WARN
                },
            },
        })
    end,
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vue_language_server_path,
                        languages = { 'vue' },
                        configNamespace = 'typescript',
                    }
                },
            },
        },
        typescript = {
            inlayHints = {
                parameterNames = { enabled = 'all' },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

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
    handlers = {
        ["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
            -- 过滤掉错误代码 2769 (No overload matches this call)
            local filtered_diagnostics = {}
            for _, diagnostic in ipairs(result.diagnostics) do
                if diagnostic.code ~= 2769 then
                    table.insert(filtered_diagnostics, diagnostic)
                end
            end
            result.diagnostics = filtered_diagnostics
            vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
        end,
    },
}

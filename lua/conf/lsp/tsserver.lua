-- local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'
local vue_language_server_path = vim.fn.expand("$MASON/packages/vue-language-server/node_modules/@vue/language-server")

return {
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json' },
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { "vue" },
            },
        },
    },
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
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
    -- settings = {
    --     javascript = {
    --         inlayHints = {
    --             includeInlayParameterNameHints = "all",
    --             includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --             includeInlayFunctionParameterTypeHints = true,
    --             includeInlayVariableTypeHints = true,
    --             includeInlayVariableTypeHintsWhenTypeMatchesName = true,
    --             includeInlayPropertyDeclarationTypeHints = true,
    --             includeInlayFunctionLikeReturnTypeHints = true,
    --             includeInlayEnumMemberValueHints = true,
    --         },
    --     },
    -- }
}

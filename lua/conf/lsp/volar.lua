local opts = {
    filetypes = { 'vue' },
    cmd = { 'vue-language-server', '--stdio', '--max-oldspace-size=4096' },
    init_options = {
        vue = {
            hybridMode = false,
        },
        typescript = {
            tsdk = vim.env.HOME .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
        },
        -- documentFeatures = {},
        -- languageFeatures = {}
    },
    -- on_attach = function(client, bufnr)
    --     client.server_capabilities.documentFormattingProvider = false
    --     client.server_capabilities.documentRangeFormattingProvider = false
    -- end
}

return opts;

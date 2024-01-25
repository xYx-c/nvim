local opts = {
    -- root_dir = function()
    --     return vim.fn.getcwd()
    -- end,
    -- filetypes = { 'vue' },
    cmd = { 'vue-language-server', '--stdio', '--max-oldspace-size=4096' },
    init_options = {
        -- typescript = {
        --     tsdk = vim.env.HOME .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
        -- },
        -- documentFeatures = {},
        -- languageFeatures = {}
    },
    -- on_attach = function(client, bufnr)
    --     client.server_capabilities.documentFormattingProvider = false
    --     client.server_capabilities.documentRangeFormattingProvider = false
    -- end
}

return opts;

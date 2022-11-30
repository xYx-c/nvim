local opts = {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { 'vue' },
    init_options = {
        typescript = {
            tsdk = vim.env.HOME .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib"
        }
    },
    documentFeatures = {
        documentFormatting = {
            defaultPrintWidth = 120
        },
    }
}

return opts;

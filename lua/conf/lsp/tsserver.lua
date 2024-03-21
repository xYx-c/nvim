local mason_registry = require('mason-registry')
local ts_plugin_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
    '/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin'

local opts = {
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = ts_plugin_path,
                languages = { "vue" },
            },
        },
    },
    -- filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
}

return opts

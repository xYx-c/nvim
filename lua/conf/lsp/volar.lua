local opts = {
    filetypes = { 'vue' },
    -- cmd = { 'vue-language-server', '--stdio', '--max-oldspace-size=4096' },
    init_options = {
        vue = {
            hybridMode = false,
        },
    },
}

return opts;

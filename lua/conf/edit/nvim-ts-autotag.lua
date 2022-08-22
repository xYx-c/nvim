-- https://github.com/windwp/nvim-ts-autotag

require('nvim-ts-autotag').setup({
    filetypes = {
        'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
        'rescript',
        'xml',
        'php',
        'markdown',
        'glimmer', 'handlebars', 'hbs',
        'wxml'
    },
})

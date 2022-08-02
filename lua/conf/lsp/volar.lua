return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { 'vue' },
    on_attach = require('keybinds').on_attach,
}

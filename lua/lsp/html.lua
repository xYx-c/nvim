return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { "html", "wxml" },
    on_attach = require('keybinds').on_attach,
}

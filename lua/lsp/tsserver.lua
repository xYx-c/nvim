return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    on_attach = require('keybinds').on_attach,
}

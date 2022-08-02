return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { "css", "scss", "less", "wxss" },
    on_attach = require('keybinds').on_attach,
}

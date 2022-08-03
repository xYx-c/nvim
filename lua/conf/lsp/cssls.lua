return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { "css", "scss", "less", "wxss" },
    on_attach = function (client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
    end,
}

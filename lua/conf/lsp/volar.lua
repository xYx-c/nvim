return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { 'vue' },
    on_attach = function (client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
    end,
}

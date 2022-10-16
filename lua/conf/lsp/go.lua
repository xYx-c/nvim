-- https://github.com/ray-x/go.nvim

require('go').setup({
    gopls_cmd = { vim.env.HOME .. '/.local/share/nvim/mason/bin/' .. 'gopls' },
    fillstruct = 'gopls',
    dap_debug = true,
    dap_debug_gui = true,
})

local opts =  {
    -- root_dir = function()
    --     return vim.fn.getcwd()
    -- end,
    -- on_attach = function (client, bufnr)
    --     require('keybinds').lsp_maps(client, bufnr)
    -- end,
}

return opts

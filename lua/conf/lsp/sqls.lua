-- https://github.com/nanotee/sqls.nvim

-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'SqlsConnectionChoice',
--     callback = function(event)
--         vim.notify(event.data.choice)
--     end,
-- })

local opts = {
    cmd = { "sqls", "-config=" .. vim.fn.getcwd() .. "/.sqls.yml" },
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
        require('keybinds').sql_maps(client, bufnr)
    end,
}
return opts

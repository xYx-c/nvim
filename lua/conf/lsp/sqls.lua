-- https://github.com/nanotee/sqls.nvim

return {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    cmd = { "sqls", "-config=" .. vim.fn.getcwd() .. "/.sqls.yml" },
    on_attach = function(client, bufnr)
        require('sqls').on_attach(client, bufnr)
        require('keybinds').sql_maps(client, bufnr)
    end
}

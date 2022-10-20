local opts = {
    root_dir = function()
        return vim.fn.getcwd()
    end,
    filetypes = { 'vue' },
    -- init_options = {
    --     typescript = {
    --         serverPath = vim.env.HOME .. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib/tsserverlibrary.js"
    --     }
    -- }
}

return opts;

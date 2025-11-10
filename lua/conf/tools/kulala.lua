-- https://github.com/mistweaverco/kulala.nvim

vim.filetype.add({
    extension = {
        ['http'] = 'http',
    },
})

require('kulala').setup({
    global_keymaps = {
        ["Send request"] = {      -- sets global mapping
            "<C-s>",
            function() require("kulala").run() end,
            mode = { "n", "v" }, -- optional mode, default is n
            ft = { "http", "rest" }, -- sets mapping for *.http files only
            desc = "Send request" -- optional description, otherwise inferred from the key
        },
    }
})

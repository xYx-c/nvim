-- https://github.com/nvimdev/guard.nvim

local ft = require('guard.filetype')

ft('vue'):fmt({
    cmd = 'prettier',
    args = {
        "--print-width=120",
        "--single-quote=true",
        "--trailing-comma=all",
        "--arrow-parens=avoid",
        "--bracket-spacing=true",
        "--end-of-line=auto",
        "--semi=true",
        "--tab-width=2",
        "--use-tabs=false"
    },
    fname = true,
    stdin = true,
})

require('guard').setup({
    -- the only options for the setup function
    fmt_on_save = false,
    -- Use lsp if no formatter was defined for this filetype
    lsp_as_default_formatter = true,
})

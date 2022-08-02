-- https://github.com/kosayoda/nvim-lightbulb
require('nvim-lightbulb').setup({
    -- LSP client names to ignore
    -- Example: {"sumneko_lua", "null-ls"}
    ignore = {},
    float = {
        enabled = true,
    },
    autocmd = {
        enabled = true,
    }
})
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb({ ignore = {"null-ls"} })]]

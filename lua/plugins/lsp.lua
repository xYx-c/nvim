return {
    -- rust
    {
        'mrcjkb/rustaceanvim',
        version = '*',
        config = function() require("conf.lsp.rustacean") end,
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        event = { "BufRead Cargo.toml" },
        config = function() require('crates').setup() end,
    },
    -- clangd
    -- {
    --     "p00f/clangd_extensions.nvim",
    --     config = function() require("conf.lsp.clangd") end
    -- },
    -- java
    { "mfussenegger/nvim-jdtls", },
    -- go
    -- { 'crispgm/nvim-go', }

    -- python
    -- 'HallerPatrick/py_lsp.nvim',
}

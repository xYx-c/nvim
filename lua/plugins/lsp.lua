return {
    -- sqls
    -- { 'nanotee/sqls.nvim' },
    -- rust
    { 'lvimuser/lsp-inlayhints.nvim', config = function() require("lsp-inlayhints").setup() end },
    {
        'mrcjkb/rustaceanvim',
        version = '*',
        config = function() require("conf.lsp.rustacean") end,
        ft = { 'rust' },
    },
    -- {
    --     "simrat39/rust-tools.nvim",
    --     config = function() require("conf.lsp.rust-tools") end
    -- },
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        config = function() require('crates').setup() end,
    },
    -- clangd
    {
        "p00f/clangd_extensions.nvim",
        config = function() require("conf.lsp.clangd") end
    },
    -- java
    { "mfussenegger/nvim-jdtls", },
    -- go
    -- {
    --     "ray-x/go.nvim",
    --     config = function() require("conf.lsp.go") end
    -- },
    -- { 'crispgm/nvim-go', }

    -- python
    -- 'HallerPatrick/py_lsp.nvim',
}

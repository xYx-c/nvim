return {
    -- sqls
    { 'nanotee/sqls.nvim' },
    -- rust
    {
        "simrat39/rust-tools.nvim",
        -- priority = 1000,
        config = function() require("conf.lsp.rust-tools") end
    },
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        config = function() require('crates').setup() end,
    },
    -- clangd
    { "p00f/clangd_extensions.nvim",
        config = function() require("conf.lsp.clangd") end
    },
    -- Civitasv/cmake-tools.nvim',
    -- java
    {
        "mfussenegger/nvim-jdtls",
    },
    -- go
    {
        "ray-x/go.nvim",
        -- priority = 1000,
        config = function() require("conf.lsp.go") end
    },
    -- python
    -- 'HallerPatrick/py_lsp.nvim',
}

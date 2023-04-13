return {
    -- sqls
    { 'nanotee/sqls.nvim' },
    -- rust
    {
        "simrat39/rust-tools.nvim",
        config = function() require("conf.lsp.rust-tools") end
    },
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
    -- Civitasv/cmake-tools.nvim',
    { 'Adversarr/xmake-nvim' },

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

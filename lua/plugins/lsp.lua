return {
    -- rust
    {
        'mrcjkb/rustaceanvim',
        lazy = false,
        config = function() require("conf.lsp.rustacean") end,
    },
    {
        'saecki/crates.nvim',
        event = { "BufRead Cargo.toml" },
        config = function() require('crates').setup() end,
    },
    { 'Civitasv/cmake-tools.nvim' },
    -- java
    {
        "mfussenegger/nvim-jdtls",
    },
}

return {
    -- rust
    {
        'mrcjkb/rustaceanvim',
        version = '^9',
        lazy = false,
        config = function() require("conf.lsp.rustacean") end,
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        event = { "BufRead Cargo.toml" },
        config = function() require('crates').setup() end,
    },
    { 'Civitasv/cmake-tools.nvim' },
    -- java
    {
        "mfussenegger/nvim-jdtls",
    },
}

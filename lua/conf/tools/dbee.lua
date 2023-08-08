-- https://github.com/kndndrj/nvim-dbee

require("dbee").setup({
    sources = {
        require("dbee.sources").MemorySource:new({
            -- {
            --     name = "postgres",
            --     type = "postgres",
            --     url = "postgres://root:root@172.18.0.10/postgres?sslmode=disable",
            -- },
            -- {
            --     name = "manager0526",
            --     type = "oracle",
            --     url = "oracle://manager0526:manager0526hyt@10.8.116.125:1521/orcl",
            -- }
        }),
        require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
        require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
    },
    editor = {
        mappings = {
            run_selection = { key = "<CR>", mode = "v" },
            run_file = { key = "BB", mode = "n" },
        },
    },
})

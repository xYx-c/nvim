-- https://github.com/kndndrj/nvim-dbee

require("dbee").setup({
    sources = {
        require("dbee.sources").MemorySource:new({
            -- {
            --     name = "postgres",
            --     type = "postgres",
            --     url = "postgres://root:root@172.18.0.10/postgres?sslmode=disable",
            -- },
        }),
        require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
        require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
        -- require("dbee.sources").FileSource:new(vim.fn.getcwd() .. "/.sqllsrc.json"),
    },
    editor = {
        mappings = {
            { key = "<CR>", mode = "v", action = "run_selection" },
            { key = "BB",   mode = "n", action = "run_file" },
        },
    },
})

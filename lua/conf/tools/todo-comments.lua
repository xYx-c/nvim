-- https://github.com/folke/todo-comments.nvim
require("todo-comments").setup(
    {
        keywords = {
            -- alt ： 别名
            FIX = {
                icon = "",
                color = "#DC2626",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" }
            },
            TODO = { icon = "", color = "#10B981" },
            todo = { icon = "", color = "#10B981" },
            HACK = { icon = "", color = "#7C3AED" },
            WARN = { icon = "", color = "#FBBF24", alt = { "WARNING", "XXX" } },
            PERF = { icon = "", color = "#FC9868", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            NOTE = { icon = "", color = "#2563EB", alt = { "INFO" } }
        },
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--glob=!node_modules",
            },
            pattern = [[\b(KEYWORDS):]],
        },
    }
)

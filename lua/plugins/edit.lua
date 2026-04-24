return {
    -- 微信小程序插件
    {
        'chemzqm/wxapp.vim',
        event = { "BufRead *.wxml" },
    },
    -- AI补全
    {
        'Exafunction/windsurf.vim',
        event = 'BufEnter',
    },
    {
        "yetone/avante.nvim",
        -- build = vim.fn.has("win32") ~= 0
        --     and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        --     or "make",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        config = function() require("conf.edit.avante") end
    },
    {
        "ravitemer/mcphub.nvim",
        build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
    },
    {
        'rareitems/printer.nvim',
        config = function() require("conf.edit.printer") end
    },
    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
            file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
        lazy = true,
    },
    -- 全局替换
    {
        'lucaspellegrinelli/rip.nvim',
        config = function() require("conf.edit.rip") end
    },
    -- {
    --     "windwp/nvim-spectre",
    --     dependencies = {
    --         "BurntSushi/ripgrep" -- 文字查找
    --     },
    --     config = function() require("conf.edit.nvim-spectre") end
    -- },
    -- 自动匹配括号
    {
        "windwp/nvim-autopairs",
        config = function() require("conf.edit.nvim-autopairs") end
    },
    -- 自动闭合标签
    {
        "windwp/nvim-ts-autotag",
        config = function() require("conf.edit.nvim-ts-autotag") end
    },
    -- 代码注释
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        config = function() require("ts-comments").setup() end
    },
    -- {
    --     "numToStr/Comment.nvim",
    --     dependencies = {
    --         "JoosepAlviste/nvim-ts-context-commentstring"
    --     },
    --     config = function() require("conf.edit.Comment") end
    -- },
    -- 自动代码补全系列插件
    'L3MON4D3/LuaSnip',
    {
        'saghen/blink.cmp',
        version = "1.*",
        event = "InsertEnter",
        config = function() require("conf.edit.blink") end,
    },
}

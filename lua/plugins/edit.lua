return {
    -- 微信小程序插件
    {
        'chemzqm/wxapp.vim',
        event = { "BufRead *.wxml" },
    },
    -- codeium 自动补全
    {
        'Exafunction/windsurf.vim',
        event = 'BufEnter',
    },
    {
        "yetone/avante.nvim",
        build = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
            or "make",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        -- dependencies = {
        -- },
        config = function() require("conf.edit.avante") end
    },
    {
        'rareitems/printer.nvim',
        config = function() require("conf.edit.printer") end
    },
    -- markdown
    -- {
    --     'jakewvincent/mkdnflow.nvim',
    --     config = function() require("conf.edit.mkdnflow") end
    -- },
    {
        -- Make sure to set this up properly if you have lazy=true
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
        "numToStr/Comment.nvim",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = function() require("conf.edit.Comment") end
    },
    -- 自动代码补全系列插件
    {
        "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
        event = "InsertEnter",
        dependencies = {
            { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
            { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" },     -- 路径补全
            -- { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
            -- { "hrsh7th/cmp-cmdline" }, -- 命令补全
            -- { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
            { "saadparwaiz1/cmp_luasnip" }, -- 适用于 luasnip 的代码片段源
            { "L3MON4D3/LuaSnip" },
            -- { "molleweide/LuaSnip-snippets.nvim" },
            -- { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
            -- { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
            -- { "f3fora/cmp-spell" }, -- 拼写建议
            -- { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
        },
        config = function() require("conf.edit.nvim-cmp") end
    },
}

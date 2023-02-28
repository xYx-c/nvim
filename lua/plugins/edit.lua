return {
    -- 微信小程序插件
    'chemzqm/wxapp.vim',
    -- copilot 自动补全
    {
        "github/copilot.vim",
        config = function() require("conf.edit.copilot") end
    },
    -- 全局替换
    {
        "windwp/nvim-spectre",
        dependencies = {
            "BurntSushi/ripgrep" -- 文字查找
        },
        config = function() require("conf.edit.nvim-spectre") end
    },
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
            { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" }, -- 路径补全
            -- { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
            -- { "hrsh7th/cmp-cmdline" }, -- 命令补全
            { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
            -- { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
            { "saadparwaiz1/cmp_luasnip" }, -- 适用于 luasnip 的代码片段源
            { "L3MON4D3/LuaSnip" },
            -- { "molleweide/LuaSnip-snippets.nvim" },
            -- { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
            -- { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
            -- { "f3fora/cmp-spell" }, -- 拼写建议
            -- { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
            -- {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
        },
        config = function() require("conf.edit.nvim-cmp") end
    },
}

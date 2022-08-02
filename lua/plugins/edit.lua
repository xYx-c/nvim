local M = {}
M.setup = function (use)
    -- 微信小程序插件
    use 'chemzqm/wxapp.vim'
    -- copilot 自动补全
    use {
        "github/copilot.vim",
        config = function()
            require("conf.edit.copilot")
        end
    }
    -- 全局替换
    use {
        "windwp/nvim-spectre",
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep" -- 文字查找
        },
        config = function()
            require("conf.edit.nvim-spectre")
        end
    }
    -- 自动匹配括号
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("conf.edit.nvim-autopairs")
        end
    }
    -- 插入模式获得函数签名
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("conf.edit.lsp_signature")
        end
    }
    -- 代码注释
    use {
        "numToStr/Comment.nvim",
        requires = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = function()
            require("conf.edit.Comment")
        end
    }
    -- 自动代码补全系列插件
    use {
        "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
        requires = {
            { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
            { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
            { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
            { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" }, -- 路径补全
            { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
            { "hrsh7th/cmp-cmdline" }, -- 命令补全
            { "f3fora/cmp-spell" }, -- 拼写建议
            { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
            { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
            -- {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
        },
        config = function()
            require("conf.edit.nvim-cmp")
        end
    }
end
return M

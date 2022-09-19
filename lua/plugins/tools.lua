local M = {}
M.setup = function(use)
    -- 内置终端增强
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("conf.tools.toggleterm")
        end
    }
    -- 消息提示
    use {
        'rcarriga/nvim-notify',
        config = function()
            require("conf.tools.nvim-notify")
        end
    }
    -- 模糊查找
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd", -- 文件查找
            -- "nvim-telescope/telescope-dap.nvim", -- DAP 调试
        },
        config = function()
            require("conf.tools.telescope")
        end
    }
    -- todo标签
    use {
        "folke/todo-comments.nvim",
        config = function()
            require("conf.tools.todo-comments")
        end
    }
    -- 自动恢复光标位置
    use {
        "ethanholz/nvim-lastplace",
        config = function()
            require("conf.tools.nvim-lastplace")
        end
    }
    -- 自动保存
    use {
        "Pocco81/auto-save.nvim",
        config = function()
            require("conf.tools.auto-save")
        end
    }
    -- debug
    use {
        "mfussenegger/nvim-dap",
        requires = {
            -- 为代码调试提供 UI 界面
            "rcarriga/nvim-dap-ui",
            -- 为代码调试提供内联文本
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function()
            require("conf.tools.nvim-dap")
        end
    }
    -- 启动加速
    use { 'lewis6991/impatient.nvim',
        config = function()
            require("conf.tools.impatient")
        end
    }
    -- 灯泡提示代码行为
    -- use {
    --     "kosayoda/nvim-lightbulb",
    --     config = function()
    --         require("conf.tools.nvim-lightbulb")
    --     end
    -- }
    -- 翻译
    use {
        "uga-rosa/translate.nvim",
        config = function()
            require("conf.tools.translate")
        end
    }
end
return M

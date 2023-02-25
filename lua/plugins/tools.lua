local M = {}
M.setup = function(use)
    -- OpenAi
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        },
        config = function()
            require("conf.tools.ChatGPT")
        end,
    })
    -- 内置终端增强
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        config = function()
            require("conf.tools.toggleterm")
        end
    }
    -- http客户端
    use {
        "NTBBloodbath/rest.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("conf.tools.rest")
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
        tag = '0.1.1',
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd", -- 文件查找
            "nvim-telescope/telescope-ui-select.nvim", -- UI
            "nvim-telescope/telescope-dap.nvim", -- DAP 调试
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
    -- 翻译
    use {
        "uga-rosa/translate.nvim",
        config = function()
            require("conf.tools.translate")
        end
    }
    -- use {
    --     "potamides/pantran.nvim",
    --     config = function()
    --         require("conf.tools.pantran")
    --     end
    -- }
    -- use {
    --     'JuanZoran/Trans.nvim',
    --     run = 'bash ./install.sh',
    --     requires = 'kkharji/sqlite.lua',
    --     config =
    --     function()
    --         require("conf.tools.Trans")
    --     end
    -- }
    -- 预览markdown
    use { "ellisonleao/glow.nvim", config = function() require("conf.tools.glow") end }
    -- 预览图片
    -- use { 'edluffy/hologram.nvim', config = function() require("conf.tools.hologram") end }
end
return M

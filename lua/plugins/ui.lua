local M = {}
M.setup = function(use)
    -- 界面美化
    use 'hood/popui.nvim'
    use 'RishabhRD/popfix'
    -- 主题
    use {
        "eddyekofo94/gruvbox-flat.nvim",
        config = function()
            require("conf.ui.gruvbox-flat")
        end
    }
    -- 状态栏
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("conf.ui.lualine")
        end
    }
    -- 支持 LSP 状态的 buffer 栏
    use {
        "akinsho/bufferline.nvim",
        requires = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
        },
        config = function()
            require("conf.ui.bufferline")
        end
    }
    -- 目录树
    use {
        "kyazdani42/nvim-tree.lua",
        requires = {
            -- 依赖一个图标插件
            "kyazdani42/nvim-web-devicons"
        },
        config = function()
            require("conf.ui.nvim-tree")
        end
    }
    -- LSP UI 美化
    use {
        "tami5/lspsaga.nvim",
        config = function()
            require("conf.ui.lspsaga")
        end
    }
    -- LSP 进度提示
    use {
        "j-hui/fidget.nvim",
        config = function()
            require("conf.ui.fidget")
        end
    }
    -- 为代码调试提供内联文本
    use {
        "theHamsta/nvim-dap-virtual-text",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("conf.ui.nvim-dap-virtual-text")
        end
    }
    -- 为代码调试提供 UI 界面
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap"
        },
        config = function()
            require("conf.ui.nvim-dap-ui")
        end
    }
    use "nvim-telescope/telescope-dap.nvim"
    -- 代码高亮
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("conf.ui.nvim-treesitter")
        end
    }
    -- use 'kyazdani42/nvim-web-devicons'
end
return M

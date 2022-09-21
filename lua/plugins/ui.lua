local M = {}
M.setup = function(use)
    -- 界面美化
    use 'hood/popui.nvim'
    use 'RishabhRD/popfix'
    -- 图标插件
    use 'kyazdani42/nvim-web-devicons'
    -- 主题
    use { "eddyekofo94/gruvbox-flat.nvim", config = function() require("conf.ui.gruvbox-flat") end }
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
    -- 代码高亮
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            -- 智能缩进
            "yioneko/nvim-yati",
        },
        config = function()
            require("conf.ui.nvim-treesitter")
        end,
    }
end
return M

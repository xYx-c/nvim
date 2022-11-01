local M = {}
M.setup = function(use)
    -- 界面美化
    use { 'stevearc/dressing.nvim', config = function()
        require('conf.ui.dressing')
    end }
    use{
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("conf.ui.noice")
        end,
    }
    -- 图标插件
    use 'kyazdani42/nvim-web-devicons'
    -- 主题
    -- use { "eddyekofo94/gruvbox-flat.nvim", config = function() require("conf.ui.gruvbox-flat") end }
    use { "folke/tokyonight.nvim", config = function() require("conf.ui.tokyonight") end }
    -- 状态栏
    use {
        'nvim-lualine/lualine.nvim',
        -- LSP 进度提示
        -- requires = { 'arkav/lualine-lsp-progress' },
        config = function()
            require("conf.ui.lualine")
        end
    }
    -- 支持 LSP 状态的 buffer 栏
    use {
        "akinsho/bufferline.nvim",
        requires = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
            -- "kazhala/close-buffers.nvim"
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
    -- use {
    --     "tami5/lspsaga.nvim",
    --     config = function()
    --         require("conf.ui.lspsaga")
    --     end
    -- }
    -- LSP 进度提示
    -- use {
    --     "j-hui/fidget.nvim",
    --     config = function()
    --         require("conf.ui.fidget")
    --     end
    -- }
    -- 代码高亮
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
        requires = {
            -- 依赖nvim-treesitter的智能缩进
            "yioneko/nvim-yati",
        },
        config = function()
            require("conf.ui.nvim-treesitter")
        end,
    }
end
return M

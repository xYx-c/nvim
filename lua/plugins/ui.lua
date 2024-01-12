return {
    -- 界面美化
    {
        "MunifTanjim/nui.nvim",
        priority = 3,
    },
    {
        "folke/noice.nvim",
        config = function() require("conf.ui.noice") end,
    },
    -- 主题
    -- { "eddyekofo94/gruvbox-flat.nvim", config = function() require("conf.ui.gruvbox-flat") end },
    {
        "rebelot/kanagawa.nvim",
        priority = 999,
        config = function() require("conf.ui.kanagawa") end
    },
    -- 状态栏
    {
        'nvim-lualine/lualine.nvim',
        -- LSP 进度提示
        -- dependencies = { 'arkav/lualine-lsp-progress' },
        config = function() require("conf.ui.lualine") end
    },
    -- css #ffffff / #666 / Blue 样式着色
    -- { "norcalli/nvim-colorizer.lua", config = function() require("conf.ui.colorizer") end },
    -- 支持 LSP 状态的 buffer 栏
    {
        "akinsho/bufferline.nvim",
        version = "*",
        priority = 2,
        dependencies = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
            -- "kazhala/close-buffers.nvim"
        },
        config = function() require("conf.ui.bufferline") end
    },
    -- 目录树
    {
        "kyazdani42/nvim-tree.lua",
        -- version = 'nightly',
        config = function() require("conf.ui.nvim-tree") end,
    },
    -- 代码高亮
    {
        'nvim-treesitter/nvim-treesitter',
        build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
        -- version = '0.7.2',
        dependencies = {
            -- 依赖nvim-treesitter的智能缩进
            -- "yioneko/nvim-yati",
        },
        config = function() require("conf.ui.nvim-treesitter") end,
    },
    -- 缩进线
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function() require("conf.ui.indent-blankline") end
    -- }

}

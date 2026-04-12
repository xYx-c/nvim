return {
    -- 界面美化
    -- {
    --     "MunifTanjim/nui.nvim",
    -- },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        config = function() require("conf.ui.noice") end,
    },
    -- 主题
    { "ellisonleao/gruvbox.nvim", lazy = false, config = function() require("conf.ui.gruvbox") end },
    -- { "rebelot/kanagawa.nvim", lazy = false, config = function() require("conf.ui.kanagawa") end },
    -- 状态栏
    {
        'nvim-lualine/lualine.nvim',
        config = function() require("conf.ui.lualine") end
    },
    -- 支持 LSP 状态的 buffer 栏
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        -- version = "*",
        config = function() require("conf.ui.bufferline") end
    },
    "famiu/bufdelete.nvim", -- 删除 buffer 时不影响现有布局
    -- 目录树
    {
        "kyazdani42/nvim-tree.lua",
        -- version = '*',
        config = function() require("conf.ui.nvim-tree") end,
    },
    -- 代码高亮
    {
        'neovim-treesitter/nvim-treesitter',
        lazy = false,
        config = function() require("conf.ui.nvim-treesitter") end,
    },
    -- 缩进线
    -- {
    --     "lukas-reineke/indent-blankline.nvim",
    --     config = function() require("conf.ui.indent-blankline") end
    -- }

}

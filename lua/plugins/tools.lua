return {
    -- DB客户端
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function() require("conf.tools.dadbod") end,
    },
    -- 内置终端增强
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        config = function() require("conf.tools.toggleterm") end
    },
    -- http客户端
    {
        'mistweaverco/kulala.nvim',
        version = '*',
        config = function() require('conf.tools.kulala') end
    },
    -- 消息提示
    {
        'rcarriga/nvim-notify',
        lazy = true,
        config = function() require("conf.tools.nvim-notify") end
    },
    -- 模糊查找
    {
        "nvim-telescope/telescope.nvim",
        -- version = '*',
        dependencies = {
            "BurntSushi/ripgrep",                      -- 文字查找
            "sharkdp/fd",                              -- 文件查找
            "nvim-telescope/telescope-ui-select.nvim", -- UI
            -- "nvim-telescope/telescope-media-files.nvim",
            -- 'nvim-lua/popup.nvim',
            -- -- 预览媒体文件
            -- 'nvim-telescope/telescope-media-files.nvim'
        },
        config = function() require("conf.tools.telescope") end
    },
    -- todo标签
    {
        "folke/todo-comments.nvim",
        config = function() require("conf.tools.todo-comments") end
    },
    -- debug
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- 为代码调试提供内联文本
            "theHamsta/nvim-dap-virtual-text",
            "igorlfs/nvim-dap-view",
        },
        config = function() require("conf.tools.nvim-dap") end
    },
    -- 为代码调试提供 UI 界面
    -- {
    --     "rcarriga/nvim-dap-ui",
    --     -- version = "*",
    --     dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" }
    -- },
    -- 翻译
    {
        "potamides/pantran.nvim",
        config = function() require("conf.tools.pantran") end
    },
    -- 预览图片
    -- { 'edluffy/hologram.nvim', config = function() require("conf.tools.hologram") end }
}

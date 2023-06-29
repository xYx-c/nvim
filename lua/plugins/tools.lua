return {
    -- OpenAi
    -- {
    --     "jackMort/ChatGPT.nvim",
    --     dependencies = { "MunifTanjim/nui.nvim" },
    --     config = function() require("conf.tools.ChatGPT") end,
    -- },
    -- DB客户端
    {
        "kndndrj/nvim-dbee",
        dependencies = { "MunifTanjim/nui.nvim" },
        build = function() require("dbee").install() end,
        config = function() require("conf.tools.dbee") end
    },
    -- 内置终端增强
    {
        "akinsho/toggleterm.nvim",
        version = '*',
        config = function() require("conf.tools.toggleterm") end
    },
    -- http客户端
    {
        "NTBBloodbath/rest.nvim",
        config = function() require("conf.tools.rest") end
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
        version = '*',
        dependencies = {
            "BurntSushi/ripgrep",                      -- 文字查找
            "sharkdp/fd",                              -- 文件查找
            "nvim-telescope/telescope-ui-select.nvim", -- UI
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
            -- 为代码调试提供 UI 界面
            "rcarriga/nvim-dap-ui",
            -- 为代码调试提供内联文本
            "theHamsta/nvim-dap-virtual-text",
        },
        config = function() require("conf.tools.nvim-dap") end
    },
    -- 翻译
    {
        "uga-rosa/translate.nvim",
        config = function() require("conf.tools.translate") end
    },
    -- 预览markdown
    { "ellisonleao/glow.nvim", config = function() require("conf.tools.glow") end }
    -- 预览图片
    -- { 'edluffy/hologram.nvim', config = function() require("conf.tools.hologram") end }
}

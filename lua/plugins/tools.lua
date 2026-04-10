return {
    {
        'jkeresman01/spring-initializr.nvim',
        config = function() require('spring-initializr').setup() end
    },
    -- DB客户端
    -- {
    --     "joryeugene/dadbod-grip.nvim",
    --     -- version = "*",
    --     config = function () require("dadbod-grip").setup({ completion = false }) end
    -- },
    {
        'tpope/vim-dadbod',
        config = function() require("conf.tools.dadbod") end,
    },
    { 'kristijanhusak/vim-dadbod-ui' },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    -- 内置终端增强
    {
        "akinsho/toggleterm.nvim",
        config = function() require("conf.tools.toggleterm") end
    },
    -- http客户端
    {
        'mistweaverco/kulala.nvim',
        config = function() require('conf.tools.kulala') end
    },
    -- 消息提示
    {
        'rcarriga/nvim-notify',
        lazy = true,
        config = function() require("conf.tools.nvim-notify") end
    },
    -- 模糊查找
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-telescope/telescope-ui-select.nvim", -- UI
    {
        "nvim-telescope/telescope.nvim",
        -- version = '*',
        -- dependencies = {
        --     'nvim-telescope/telescope-media-files.nvim'
        -- },
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
        config = function() require("conf.tools.nvim-dap") end
    },
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
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

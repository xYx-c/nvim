return {
    -- 启动加速
    -- https://github.com/lewis6991/impatient.nvim
    -- { 'lewis6991/impatient.nvim', config = function() require("impatient") end },
    -- Lua 开发模块
    "nvim-lua/plenary.nvim",
    -- LSP 基础服务
    "neovim/nvim-lspconfig",
    -- 图标插件
    'kyazdani42/nvim-web-devicons',
    -- 安装 LSP/DAP
    {
        "williamboman/mason.nvim",
        priority = 1,
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function() require("conf.lsp.mason") end,
    },
    -- {
    --     "jose-elias-alvarez/null-ls.nvim",
    --     config = function() require("conf.lsp.null-ls") end,
    -- },
    -- 自动恢复光标位置
    {
        "ethanholz/nvim-lastplace",
        config = function() require("conf.tools.nvim-lastplace") end
    },
    -- 自动保存
    {
        "Pocco81/auto-save.nvim",
        config = function() require("conf.tools.auto-save") end
    },
    -- jk加速
    { 'rainbowhxch/accelerated-jk.nvim' },
    -- 按键逃脱
    { "max397574/better-escape.nvim",   config = function() require("better_escape").setup() end },
}

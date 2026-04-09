return {
    -- Lua 开发模块
    "nvim-lua/plenary.nvim",
    -- LSP 基础服务
    "neovim/nvim-lspconfig",
    -- 图标插件
    'kyazdani42/nvim-web-devicons',
    -- 安装 LSP/DAP
    {
        "mason-org/mason.nvim",
        priority = 1,
        version = "*",
        dependencies = { "mason-org/mason-lspconfig.nvim" },
        config = function() require("conf.lsp.mason") end,
        build = ":MasonUpdate",
    },
    -- 格式化
    {
        'stevearc/conform.nvim',
        config = function() require("conf.edit.conform") end
    },
    -- 自动恢复光标位置
    {
        "ethanholz/nvim-lastplace",
        config = function() require("conf.tools.nvim-lastplace") end
    },
    -- 自动保存
    {
        "Pocco81/auto-save.nvim",
        config = function() require("conf.tools.auto-save") end,
    },
}

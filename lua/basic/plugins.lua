vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
use 'vim-airline/vim-airline'
use 'Yggdroot/LeaderF'
use 'github/copilot.vim'
-- 代码注释
use "tomtom/tcomment_vim"
-- 主题
use {
    "ellisonleao/gruvbox.nvim",
    config = function()
        require("conf.gruvbox")
    end
}
-- 快捷终端
use "skywind3000/vim-terminal-help"
-- LSP 基础服务
use {
    "neovim/nvim-lspconfig",
    config = function()
        require("conf.nvim-lspconfig")
    end
}
-- 自动安装 LSP
use { "williamboman/nvim-lsp-installer",
    config = function()
        require("conf.nvim-lsp-installer")
    end
}
-- LSP UI 美化
use {
    "tami5/lspsaga.nvim",
    config = function()
        require("conf.lspsaga")
    end
}
-- LSP 进度提示
-- use {
--     "j-hui/fidget.nvim",
--     config = function()
--         require("conf.fidget")
--     end
-- }
-- 插入模式获得函数签名
-- use {
--     "ray-x/lsp_signature.nvim",
--     config = function()
--         require("conf.lsp_signature")
--     end
-- }
-- 灯泡提示代码行为
-- use {
--     "kosayoda/nvim-lightbulb",
--     config = function()
--         require("conf.nvim-lightbulb")
--     end
-- }
-- java
use {
"mfussenegger/nvim-jdtls",
config = function()
    require("conf.nvim-jdtls")
end
}
-- java_debug
-- use 'neoclide/coc.nvim'
-- use {'puremourning/vimspector', opt=true}
use {
    "mfussenegger/nvim-dap",
    config = function()
        require("conf.nvim-dap")
    end
}
-- 为代码调试提供内联文本
use {
    "theHamsta/nvim-dap-virtual-text",
    requires = {
        "mfussenegger/nvim-dap"
    },
    config = function()
        require("conf.nvim-dap-virtual-text")
    end
}
-- 为代码调试提供 UI 界面
use {
    "rcarriga/nvim-dap-ui",
    requires = {
        "mfussenegger/nvim-dap"
    },
    config = function()
        require("conf.nvim-dap-ui")
    end
}
-- nvim-tree
use {
"kyazdani42/nvim-tree.lua",
requires = {
    -- 依赖一个图标插件
    "kyazdani42/nvim-web-devicons"
},
config = function()
    -- 插件加载完成后自动运行 lua/conf/nvim-tree.lua 文件中的代码
    require("conf.nvim-tree")
end
}
-- 自动代码补全系列插件
use {
"hrsh7th/nvim-cmp",  -- 代码补全核心插件，下面都是增强补全的体验插件
requires = {
    {"onsails/lspkind-nvim"}, -- 为补全添加类似 vscode 的图标
    {"hrsh7th/vim-vsnip"}, -- vsnip 引擎，用于获得代码片段支持
    {"hrsh7th/cmp-vsnip"}, -- 适用于 vsnip 的代码片段源
    {"hrsh7th/cmp-nvim-lsp"}, -- 替换内置 omnifunc，获得更多补全
    {"hrsh7th/cmp-path"}, -- 路径补全
    {"hrsh7th/cmp-buffer"}, -- 缓冲区补全
    {"hrsh7th/cmp-cmdline"}, -- 命令补全
    {"f3fora/cmp-spell"}, -- 拼写建议
    {"rafamadriz/friendly-snippets"}, -- 提供多种语言的代码片段
    {"lukas-reineke/cmp-under-comparator"}, -- 让补全结果的排序更加智能
    -- {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
},
config = function()
    require("conf.nvim-cmp")
end
}
end)

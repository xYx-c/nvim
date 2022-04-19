local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        -- open_fn = function()
        --   return require("packer.util").float { border = "rounded" }
        -- end,
    },
}

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- 状态栏
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require("conf.lualine")
        end
    }
    -- 支持 LSP 状态的 buffer 栏
    use {
        "akinsho/bufferline.nvim",
        requires = {
            "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
        },
        config = function()
            require("conf.bufferline")
        end
    }
    -- 模糊查找
    use {
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep", -- 文字查找
            "sharkdp/fd" -- 文件查找
        },
        config = function()
            require("conf.telescope")
        end
    }
    -- copilot 自动补全
    use {
        "github/copilot.vim",
        config = function()
            require("conf.copilot")
        end
    }
    -- 主题
    use {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("conf.gruvbox")
        end
    }
    -- 全局替换
    use {
        "nvim-pack/nvim-spectre",
        requires = {
            "nvim-lua/plenary.nvim", -- Lua 开发模块
            "BurntSushi/ripgrep" -- 文字查找
        },
        config = function()
            require("conf.nvim-spectre")
        end
    }
    -- 内置终端
    use {
        "akinsho/toggleterm.nvim",
        config = function()
            require("conf.toggleterm")
        end
    }
    -- 自动匹配括号
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("conf.nvim-autopairs")
        end
    }
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
    use {
        "j-hui/fidget.nvim",
        config = function()
            require("conf.fidget")
        end
    }
    -- 插入模式获得函数签名
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("conf.lsp_signature")
        end
    }
    -- 代码注释
    use {
        "numToStr/Comment.nvim",
        requires = {
            "JoosepAlviste/nvim-ts-context-commentstring"
        },
        config = function()
            require("conf.Comment")
        end
    }
    -- todo tree
    use {
        "folke/todo-comments.nvim",
        config = function()
            require("conf.todo-comments")
        end
    }
    -- 灯泡提示代码行为
    use {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("conf.nvim-lightbulb")
        end
    }
    -- 自动保存
    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("conf.AutoSave")
        end
    }
    -- java
    use {
        "mfussenegger/nvim-jdtls",
        config = function()
            require("conf.nvim-jdtls")
        end
    }
    -- debug
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
    use {
        "ravenxrz/DAPInstall.nvim",
        config = function()
            require("conf.dap-install")
        end
    }
    -- 代码高亮
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require("conf.nvim-treesitter")
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
        "hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
        requires = {
            { "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
            { "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
            { "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
            { "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
            { "hrsh7th/cmp-path" }, -- 路径补全
            { "hrsh7th/cmp-buffer" }, -- 缓冲区补全
            { "hrsh7th/cmp-cmdline" }, -- 命令补全
            { "f3fora/cmp-spell" }, -- 拼写建议
            { "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
            { "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
            -- {"tzachar/cmp-tabnine", run = "./install.sh"} -- tabnine 源,提供基于 AI 的智能补全
        },
        config = function()
            require("conf.nvim-cmp")
        end
    }
end)

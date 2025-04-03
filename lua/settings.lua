---------------------------------------------------------------------------
-- Basic Setting
---------------------------------------------------------------------------
vim.o.encoding = "utf-8"              -- 设定各种文本的字符编码
vim.o.fileencodings = "utf-8,gb18030" -- 设定读取和写入文件的字符编码
-- vim.o.termencoding = "utf-8"                        -- 设定终端的字符编码
vim.o.wrap = false                    -- 自动换行
vim.o.updatetime = 128                -- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
vim.o.timeoutlen = 512                -- 设定等待按键时长的毫秒数
vim.o.showcmd = true                  -- 是否在屏幕最后一行显示命令
vim.o.hidden = true                   -- 是否允许缓冲区未保存时就切换
vim.o.termguicolors = true            -- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.cursorline = true               -- 是否高亮当前文本行
-- vim.o.syntax = "enable"                             -- 是否开启语法高亮
vim.o.number = true                   -- 是否显示行号
vim.o.relativenumber = true           -- 是否显示相对行号
vim.o.signcolumn = "yes"              -- 是否显示标记列
vim.o.scrolloff = 10                  -- 设定光标上下两侧最少保留的屏幕行数
vim.o.mouse = ""                      -- 是否支持鼠标操作
vim.o.clipboard = "unnamedplus"       -- 是否启用系统剪切板
vim.o.backup = false                  -- 是否开启备份文件
vim.o.swapfile = false                -- 是否开启交换文件
-- vim.o.list = true                                -- 是否特殊显示空格等字符
vim.o.fillchars = 'eob: '             -- 空行填充字符
vim.o.autoindent = true               -- 是否开启自动缩进对齐上一行缩进
vim.o.smartindent = true              -- 是否开启智能缩进
vim.o.cindent = true                  -- 是否开启 C 语言风格的缩进
vim.o.indentexpr = ""                 -- 设定缩进表达式
vim.o.filetype = "plugin"             -- 设定自动缩进的策略为 plugin
vim.o.softtabstop = 2                 -- 设定按退格键时可以一次删掉 N 个空格
vim.o.tabstop = 2                     -- 设定 tab 长度为 N
vim.o.shiftwidth = 2                  -- 设定自动缩进的长度为 N
vim.o.expandtab = true                -- 是否使用空格来替换制表符
vim.o.hlsearch = true                 -- 是否开启高亮搜索
-- vim.o.showmatch = true                           -- 是否在插入括号时短暂跳转到另一半括号上
vim.o.wildmenu = true                 -- 是否开启命令行补全
vim.o.ignorecase = true               -- 是否在搜索时忽略大小写
vim.o.smartcase = true                -- 是否开启在搜索时如果有大写字母，则关闭忽略大小写的选项
-- vim.o.spell = true                                   -- 是否开启单词拼写检查
-- vim.o.spelllang = "en_us,cjk"                        -- 设定单词拼写检查的语言
vim.o.completeopt = "menu,menuone,noselect" -- 设定补全菜单的显示方式
vim.o.background = "dark"                   -- 设定背景颜色

vim.o.foldenable = true                     -- 是否开启代码折叠
vim.o.foldlevel = 99                        -- 指定代码折叠的最高层级为 99
-- vim.o.foldmethod = "indent"                         -- 指定代码折叠的策略是按照缩进进行的

----------------------------------------------------------------------------------------------
-- 设置treesitter折叠
----------------------------------------------------------------------------------------------
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
    end
})

-- local system = io.popen("uname -s"):read("*l")
-- if system == "Darwin" then
--     vim.cmd[[
--         let $LANG = 'en_US.UTF-8'
--     ]]
-- end
---------------------------------------------------------------------------
-- Sign Setting
---------------------------------------------------------------------------
-- 设置断点样式
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "TodoFgFIX", linehl = "", numhl = "" })
vim.diagnostic.config({
    virtual_text = {
        current_line = true,
    },
    underline = {
        severity = {
            min = vim.diagnostic.severity.INFO
        },
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
        }
    }
})

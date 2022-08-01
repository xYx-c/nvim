vim.o.encoding = "utf-8"                            -- 设定各种文本的字符编码
vim.o.termencoding = "utf-8"                        -- 设定终端的字符编码
vim.o.wrap = false                                  -- 自动换行
vim.o.updatetime = 100                              -- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
vim.o.timeoutlen = 500                              -- 设定等待按键时长的毫秒数
vim.o.showcmd = true                                -- 是否在屏幕最后一行显示命令
vim.o.hidden = true                                 -- 是否允许缓冲区未保存时就切换
vim.o.termguicolors = true                          -- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.cursorline = true                             -- 是否高亮当前文本行
-- vim.o.syntax = "enable"                          -- 是否开启语法高亮
vim.o.number = true                                 -- 是否显示绝对行号
vim.o.signcolumn = "yes"                            -- 是否显示标记列
vim.o.relativenumber = false                        -- 是否显示相对行号
vim.o.scrolloff = 10                                -- 设定光标上下两侧最少保留的屏幕行数
-- vim.o.mouse = "a"                                -- 是否支持鼠标操作
vim.o.clipboard = "unnamedplus"                     -- 是否启用系统剪切板
vim.o.backup = false                                -- 是否开启备份文件
vim.o.swapfile = false                              -- 是否开启交换文件
-- vim.o.list = true                                -- 是否特殊显示空格等字符
vim.o.autoindent = true                             -- 是否开启自动缩进
vim.o.filetype = "plugin"                           -- 设定自动缩进的策略为 plugin
vim.o.hlsearch = true                               -- 是否开启高亮搜索
-- vim.o.showmatch = true                           -- 是否在插入括号时短暂跳转到另一半括号上
vim.o.wildmenu = true                               -- 是否开启命令行补全
vim.o.ignorecase = true                             -- 是否在搜索时忽略大小写
vim.o.smartcase = true                              -- 是否开启在搜索时如果有大写字母，则关闭忽略大小写的选项
-- vim.o.spell = true                               -- 是否开启单词拼写检查
-- vim.o.spelllang = "en_us,cjk"                    -- 设定单词拼写检查的语言
vim.o.foldenable = true                             -- 是否开启代码折叠
vim.o.foldmethod = "indent"                         -- 指定代码折叠的策略是按照缩进进行的
vim.o.foldlevel = 100                               -- 指定代码折叠的最高层级为 100

local system = io.popen("uname -s"):read("*l")
if system == "Darwin" then
    vim.cmd[[
        let $LANG = 'en_US.UTF-8'
    ]]
end

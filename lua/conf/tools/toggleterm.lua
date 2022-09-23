-- https://github.com/akinsho/toggleterm.nvim
-- https://github.com/jesseduffield/lazygit.git

-- macOS
-- brew install lazygit
-- or
-- brew install jesseduffield/lazygit/lazygit

-- Debian
-- sudo add-apt-repository ppa:lazygit-team/release
-- sudo apt-get update
-- sudo apt-get install lazygit

local function inInsert()
    -- 删除 Esc 的映射
    vim.keybinds.dgmap("t", "<Esc>")
end

local Toggleterm = require("toggleterm")
Toggleterm.setup(
    {
        --  开启的终端默认进入插入模式
        start_in_insert = true,
        -- 设置终端打开的大小
        size = 10,
        -- 打开普通终端时，关闭拼写检查
        on_open = function(term)
            vim.cmd("setlocal nospell")
            inInsert()
            vim.keybinds.bmap(term.bufnr, "t", "<C-t>", "<C-\\><C-n>:close<CR>", vim.keybinds.opts)
            vim.keybinds.bmap(term.bufnr, "t", "<C-w>", "<C-\\><C-n>", vim.keybinds.opts)
        end,
        on_close = function()
            -- 重新映射 Esc
            vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
        end

    }
)
-- 新建终端
local Terminal = require("toggleterm.terminal").Terminal
-- 新建浮动终端
local floatTerm =
Terminal:new(
    {
        hidden = true,
        direction = "float",
        float_opts = {
            border = "single"
        },
        on_open = function(term)
            inInsert()
            vim.keybinds.bmap(term.bufnr, "t", "<C-t>", "<C-\\><C-n>:close<CR>", vim.keybinds.opts)
            vim.keybinds.bmap(term.bufnr, "t", "<C-w>", "<C-\\><C-n>", vim.keybinds.opts)
        end,
        on_close = function()
            -- 重新映射 Esc
            vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
        end
    }
)
-- 新建 lazygit 终端
local lazyGit =
Terminal:new(
    {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = {
            border = "double"
        },
        on_open = function(term)
            inInsert()
            -- lazygit 中 q 是退出
            vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts)
        end,
        on_close = function()
            -- 重新映射 Esc
            vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
        end
    }
)
-- 定义新的方法
Toggleterm.float_toggle = function()
    floatTerm:toggle()
end
Toggleterm.lazygit_toggle = function()
    lazyGit:toggle()
end

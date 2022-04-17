-- leader键设置
vim.g.mapleader = ","

-- 默认的键位函数设置
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    opts = {noremap = true, silent = true}
}

-- 插入模下 jj/jk 退出插入模式
vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)

-- 用 H 和 L 代替 ^ 与 $
vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
vim.keybinds.gmap("v", "L", "$", vim.keybinds.opts)

-- 将 C-u 和 C-d 调整为上下滑动 10 行而不是半页
vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)

-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<C-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<C-l>", "<right>", vim.keybinds.opts)

-- 修改分屏大小
vim.keybinds.gmap("n", "<M-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<M-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)

-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)

-- 通过 leader cs 切换拼写检查
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)

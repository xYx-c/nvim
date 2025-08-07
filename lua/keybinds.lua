-- leader键设置
vim.g.mapleader = ","
-- 默认的键位函数设置
vim.keybinds = {
    gmap = vim.api.nvim_set_keymap,
    bmap = vim.api.nvim_buf_set_keymap,
    dgmap = vim.api.nvim_del_keymap,
    dbmap = vim.api.nvim_buf_del_keymap,
    set = vim.keymap.set,
    opts = { noremap = true, silent = true }
}
local M = {}
---------------------------------------------------------------------------
-- 基础键位设置
---------------------------------------------------------------------------
vim.keybinds.gmap("i", "jj", "<Esc>", vim.keybinds.opts)
vim.keybinds.gmap("i", "jk", "<Esc>", vim.keybinds.opts)
-- vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
-- vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
-- 剪切单词
vim.keymap.set('v', 'x', 'iws', vim.keymap.opts)
-- 分屏窗口移动
vim.keybinds.gmap("n", "<C-k>", "<c-w>k", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-j>", "<c-w>j", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-h>", "<c-w>h", vim.keybinds.opts)
vim.keybinds.gmap("n", "<C-l>", "<c-w>l", vim.keybinds.opts)
-- H 和 L 代替 ^ 与 $
-- vim.keybinds.gmap("n", "H", "^", vim.keybinds.opts)
vim.keybinds.gmap("v", "H", "^", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "L", "$", vim.keybinds.opts)
vim.keybinds.gmap("v", "L", "$h", vim.keybinds.opts)
-- 将 C-u 和 C-d 调整为上下滑动 10 行
-- vim.keybinds.gmap("n", "<C-u>", "10k", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<C-d>", "10j", vim.keybinds.opts)
-- 插入模式下的上下左右移动
vim.keybinds.gmap("i", "<M-k>", "<up>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<M-j>", "<down>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<M-h>", "<left>", vim.keybinds.opts)
vim.keybinds.gmap("i", "<M-l>", "<right>", vim.keybinds.opts)
-- 修改分屏大小
vim.keybinds.gmap("n", "<S-up>", "<cmd>res +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<S-down>", "<cmd>res -1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<S-left>", "<cmd>vertical resize-1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<S-right>", "<cmd>vertical resize+1<CR>", vim.keybinds.opts)
-- 正常模式下按 ESC 取消高亮显示
vim.keybinds.gmap("n", "<ESC>", ":nohlsearch<CR>", vim.keybinds.opts)
-- 通过 leader cs 切换拼写检查
vim.keybinds.gmap("n", "<leader>cs", "<cmd>set spell!<CR>", vim.keybinds.opts)
-- 上下移动行内容
vim.keybinds.gmap("n", "<c-n>", ":move +1<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<c-p>", ":move -2<CR>", vim.keybinds.opts)
vim.keybinds.gmap("v", "<c-n>", ":move'> +1<CR>`<my`>mzgv`yo`z", vim.keybinds.opts)
vim.keybinds.gmap("v", "<c-p>", ":move'< -2<CR>`<my`>mzgv`yo`z", vim.keybinds.opts)
-- 打印内容
vim.keymap.set("n", "P", "<Plug>(printer_print)iw")
vim.keymap.set("v", "P", "<Plug>(printer_print)")
---------------------------------------------------------------------------
-- 显示历史弹窗记录
vim.keybinds.gmap("n", "<leader>nh", "<cmd>Telescope notify theme=dropdown<CR>", vim.keybinds.opts)
-- 查找TODO标签
vim.keybinds.gmap("n", "<leader>b", "<cmd>TodoTelescope theme=dropdown<CR>", vim.keybinds.opts)
-- copilot AI提示
-- vim.keybinds.gmap("i", "<C-l>", "copilot#Accept('')", { silent = true, expr = true })
-- codeium AI提示
vim.g.codeium_disable_bindings = 1
vim.keymap.set('i', '<c-l>', "codeium#Accept()", { silent = true, expr = true })
vim.keymap.set('i', '<c-x>', "codeium#Clear()", { silent = true, expr = true })
vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { silent = true, expr = true })
---------------------------------------------------------------------------
-- lsp
---------------------------------------------------------------------------
M.lsp_maps = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keybinds.bmap(bufnr, 'n', '<leader>ds', '<cmd>Telescope lsp_document_symbols theme=dropdown<CR>',
        vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols theme=dropdown<CR>',
        vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>q', '<cmd>Telescope diagnostics bufnr=0 theme=dropdown<CR>', vim.keybinds
        .opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>Q', '<cmd>Telescope diagnostics theme=dropdown<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', vim.keybinds.opts)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keybinds.bmap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'gt', '<cmd>Telescope lsp_type_definitions theme=dropdown<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'gd', '<cmd>Telescope lsp_definitions theme=dropdown<CR>', vim.keybinds.opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keybinds.bmap(bufnr, 'n', 'gi', '<cmd>Telescope lsp_implementations theme=dropdown<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'n', 'gr', '<cmd>Telescope lsp_references theme=dropdown<CR>', vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'i', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', vim.keybinds.opts)

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, bufopts)

    vim.keybinds.bmap(bufnr, 'n', '<leader>D', '<cmd>Telescope lsp_type_definitions theme=dropdown<CR>',
        vim.keybinds.opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)

    -- vim.keybinds.set('n', '=', function() vim.lsp.buf.format { async = true, bufnr = bufnr } end, bufopts)
    -- vim.cmd [[command! -buffer Format execute 'lua vim.lsp.buf.format{ async = true, bufnr = bufnr }']]
    vim.keybinds.set('n', '=', function() vim.cmd [[Format]] end, bufopts)


    -- vim.keybinds.bmap(bufnr, "i", "<C-n>", "<Plug>luasnip-next-choice", vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, "s", "<C-n>", "<Plug>luasnip-next-choice", vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, "i", "<C-p>", "<Plug>luasnip-prev-choice", vim.keybinds.opts)
    -- vim.keybinds.bmap(bufnr, "s", "<C-p>", "<Plug>luasnip-prev-choice", vim.keybinds.opts)
end
---------------------------------------------------------------------------
-- sql_maps
---------------------------------------------------------------------------
M.sql_maps = function(_, bufnr)
    vim.keybinds.bmap(bufnr, 'n', '%', "<cmd>SqlsExecuteQuery<cr>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'v', '<cr>', "<Plug>(sqls-execute-query)<cr>", vim.keybinds.opts)
    vim.keybinds.bmap(bufnr, 'v', '<c-r>', "<Plug>(sqls-execute-query-vertical)<cr>", vim.keybinds.opts)
    vim.keymap.set('i', "<right>", "<right>", { noremap = true, silent = true, buffer = bufnr })
    vim.keymap.set('i', "<left>", "<left>", { noremap = true, silent = true, buffer = bufnr })
end
---------------------------------------------------------------------------
-- buffer
---------------------------------------------------------------------------
-- 关闭当前 buffer，由 bufdelete 插件所提供的方法
vim.keybinds.gmap("n", "<C-w>", "<cmd>Bdelete!<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<C-w>", "[[<CMD>lua require('close_buffers').delete({type = 'this'})<CR>]]", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "<C-w>", "<cmd>BufferLinePickClose<CR>", vim.keybinds.opts)
-- 切换上一个缓冲区
vim.keybinds.gmap("n", "<leader>bu", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<leader>bu", "<C-\\><C-n><cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "H", "<cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("t", "H", "<C-\\><C-n><cmd>BufferLineCyclePrev<CR>", vim.keybinds.opts)
-- 切换下一个缓冲区
vim.keybinds.gmap("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("t", "<leader>bn", "<C-\\><C-n><cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "L", "<cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("t", "L", "<C-\\><C-n><cmd>BufferLineCycleNext<CR>", vim.keybinds.opts)
-- 关闭左侧缓冲区
vim.keybinds.gmap("n", "<leader>bh", "<cmd>BufferLineCloseLeft<CR>", vim.keybinds.opts)
-- 关闭右侧缓冲区
vim.keybinds.gmap("n", "<leader>bl", "<cmd>BufferLineCloseRight<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>bc", "<cmd>BufferLineCloseLeft<CR><cmd>BufferLineCloseRight<CR>", vim.keybinds.opts)
-- 移动缓冲区
vim.keybinds.gmap("n", "<leader>bn", "<cmd>BufferLineMoveNext<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>bp", "<cmd>BufferLineMovePrev<CR>", vim.keybinds.opts)
-- 跳转到缓冲区
vim.keybinds.gmap("n", "<leader>1", "<cmd>lua require('bufferline').go_to_buffer(1, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>2", "<cmd>lua require('bufferline').go_to_buffer(2, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>3", "<cmd>lua require('bufferline').go_to_buffer(3, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>4", "<cmd>lua require('bufferline').go_to_buffer(4, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>5", "<cmd>lua require('bufferline').go_to_buffer(5, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>6", "<cmd>lua require('bufferline').go_to_buffer(6, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>7", "<cmd>lua require('bufferline').go_to_buffer(7, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>8", "<cmd>lua require('bufferline').go_to_buffer(8, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>9", "<cmd>lua require('bufferline').go_to_buffer(9, true)<cr>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>$", "<cmd>lua require('bufferline').go_to_buffer(-1, true)<cr>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- dap-debug
---------------------------------------------------------------------------
-- 打开浮动窗口
vim.keybinds.gmap("v", "K", "<cmd>lua require('dapui').eval()<CR>", vim.keybinds.opts)
vim.cmd [[command! DapScope execute "lua require('dapui').float_element('scopes') require('dapui').float_element('scopes')"]]
vim.cmd [[command! DapWatches execute "lua require('dapui').float_element('watches') require('dapui').float_element('watches')"]]
vim.cmd [[command! DapStacks execute "lua require('dapui').float_element('stacks') require('dapui').float_element('stacks')"]]
-- 打断点
vim.keybinds.gmap("n", "@", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", vim.keybinds.opts)
-- 开启调试或到下一个断点处
vim.keybinds.gmap("n", "\\", "<cmd>lua require'dap'.continue()<CR>", vim.keybinds.opts)
-- 单步进入执行（会进入函数内部，有回溯阶段）
vim.keybinds.gmap("n", "{", "<cmd>lua require'dap'.step_into()<CR>", vim.keybinds.opts)
-- 单步跳过执行（不进入函数内部，无回溯阶段）
vim.keybinds.gmap("n", "[", "<cmd>lua require'dap'.step_over()<CR>", vim.keybinds.opts)
-- 步出当前函数
vim.keybinds.gmap("n", "]", "<cmd>lua require'dap'.step_out()<CR>", vim.keybinds.opts)
-- 显示或隐藏调试界面
vim.keybinds.gmap("n", "W", "<cmd>lua require('dapui').toggle()<CR>", vim.keybinds.opts)
-- 退出调试（关闭调试，关闭 repl，关闭 ui，清除内联文本）
vim.keybinds.gmap("n", "Q", "<cmd>lua require'dapui'.close()<CR><cmd>DapVirtualTextForceRefresh<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- search-file or replace-file
---------------------------------------------------------------------------
-- 全项目替换
vim.keymap.set("n", "<c-t>", "<cmd>lua require'rip'.replace_in_git()<CR>", vim.keybinds.opts)
vim.keymap.set("n", "T", "<cmd>lua require'rip'.replace_in_project()<CR>", vim.keybinds.opts)
-- vim.keybinds.gmap("n", "T", "<cmd>lua require('spectre').open()<CR>", vim.keybinds.opts)
-- 只替换当前文件
-- vim.keybinds.gmap("n", "<c-t>", "viw:lua require('spectre').open_file_search()<CR>", vim.keybinds.opts)
-- 全项目中搜索当前单词
-- vim.keybinds.gmap("n", "R", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", vim.keybinds.opts)
-- 查找文件
vim.keybinds.gmap("n", "F", "<cmd>Telescope find_files theme=dropdown<CR>", vim.keybinds.opts)
-- 查找文字
vim.keybinds.gmap("n", "<C-f>", "<cmd>Telescope live_grep theme=dropdown<CR>", vim.keybinds.opts)
-- 查找Buffer
vim.keybinds.gmap("n", "<c-b>", "<cmd>Telescope buffers theme=dropdown<CR>", vim.keybinds.opts)
-- 查找帮助文档
vim.keybinds.gmap("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", vim.keybinds.opts)
-- 查找最近打开的文件
vim.keybinds.gmap("n", ";", "<cmd>Telescope oldfiles theme=dropdown<CR>", vim.keybinds.opts)
-- 查找 marks标记
vim.keybinds.gmap("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", vim.keybinds.opts)
-- vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)
---------------------------------------------------------------------------
-- file-tree
---------------------------------------------------------------------------
-- 打开文件树
vim.keybinds.gmap("n", "<C-a>", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
-- 按 leader fc 在文件树中找到当前以打开文件的位置
vim.keybinds.gmap("n", "<C-x>", "<cmd>NvimTreeFindFile<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- http_client
---------------------------------------------------------------------------
vim.keybinds.gmap("n", "<C-s>", "<cmd>lua require('kulala').run()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>hh", "<cmd>lua require('kulala').jump_prev()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>hl", "<cmd>lua require('kulala').jump_next()<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- terminal
---------------------------------------------------------------------------
-- 退出终端插入模式
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
-- 打开普通终端
vim.keybinds.gmap("n", "~", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
-- 打开浮动终端
vim.keybinds.gmap("n", "`", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
-- 打开lazy git 终端
vim.keybinds.gmap("n", "<leader>m", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
-- 打开或关闭所有终端
vim.keybinds.gmap("n", "<leader>tc", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], { buffer = 0 })
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], { buffer = 0 })
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], { buffer = 0 })
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], { buffer = 0 })
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], { buffer = 0 })
-- 要需创建多个终端，可：
-- 1 <键位> leader tt
-- 2 <键位>
-- ... <键位>
-- 另外，上面我们新建了 2 个特殊终端，所以普通终端的顺序应该是从 3 开始
---------------------------------------------------------------------------
-- 翻译
---------------------------------------------------------------------------
vim.keymap.set("x", "t", require('pantran').motion_translate, { noremap = true, silent = true, expr = true })
vim.keymap.set("n", "t", "<cmd>Pantran source=zh target=en<CR>", vim.keybinds.opts)
---------------------------------------------------------------------------
-- database
---------------------------------------------------------------------------
vim.keymap.set({ 'n', 'x' }, "<C-e>", "<cmd>DBUIToggle<CR>", vim.keybinds.opts)
vim.keymap.set('v', "<Enter>", "<Plug>(DBUI_ExecuteQuery)", vim.keybinds.opts)

return M

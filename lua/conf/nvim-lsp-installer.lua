-- https://github.com/williamboman/nvim-lsp-installer
local lsp_installer_servers = require("nvim-lsp-installer.servers")
-- WARN: 手动书写 LSP 配置文件
-- 名称：https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- 配置：https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    -- 语言服务器名称：配置选项
    sumneko_lua = require("lsp.sumneko_lua"),
    rust_analyzer = require("lsp.rust_analyzer"),
    -- jdtls = require("lsp.jdtls"),
    volar = require("lsp.volar"),
    tsserver = require("lsp.tsserver"),
    clangd = require("lsp.clangd"),
    gopls = require("lsp.gopls"),
    taplo = require("lsp.taplo"),
    lemminx = require("lsp.lemminx"),
}

-- LSP 服务启动后的按键加载
-- local function attach(_, bufnr)
--     -- 跳转到定义（代替内置 LSP 的窗口，telescope 插件让跳转定义更方便）
--     vim.keybinds.bmap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", vim.keybinds.opts)
--     -- 列出光标下所有引用（代替内置 LSP 的窗口，telescope 插件让查看引用更方便）
--     vim.keybinds.bmap(bufnr, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", vim.keybinds.opts)
--     -- 工作区诊断（代替内置 LSP 的窗口，telescope 插件让工作区诊断更方便）
--     vim.keybinds.bmap(bufnr, "n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", vim.keybinds.opts)
--     -- 显示代码可用操作（代替内置 LSP 的窗口，telescope 插件让代码行为更方便）
--     vim.keybinds.bmap(bufnr, "n", "<leader>ac", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", vim.keybinds.opts)
--     -- 变量重命名（代替内置 LSP 的窗口，Lspsaga 让变量重命名更美观）
--     vim.keybinds.bmap(bufnr, "n", "<leader>cn", "<cmd>Lspsaga rename<CR>", vim.keybinds.opts)
--     -- 查看帮助信息（代替内置 LSP 的窗口，Lspsaga 让查看帮助信息更美观）
--     vim.keybinds.bmap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", vim.keybinds.opts)
--     -- 跳转到上一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
--     vim.keybinds.bmap(bufnr, "n", "g[", "<cmd>Lspsaga diagnostic_jump_prev<CR>", vim.keybinds.opts)
--     -- 跳转到下一个问题（代替内置 LSP 的窗口，Lspsaga 让跳转问题更美观）
--     vim.keybinds.bmap(bufnr, "n", "g]", "<cmd>Lspsaga diagnostic_jump_next<CR>", vim.keybinds.opts)
--     -- 悬浮窗口上翻页，由 Lspsaga 提供
--     vim.keybinds.bmap(
--         bufnr,
--         "n",
--         "<C-p>",
--         "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>",
--         vim.keybinds.opts
--     )
--     -- 悬浮窗口下翻页，由 Lspsaga 提供
--     vim.keybinds.bmap(
--         bufnr,
--         "n",
--         "<C-n>",
--         "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>",
--         vim.keybinds.opts
--     )
-- end

local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(_, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>cf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end
-- 自动安装或启动 LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- 判断服务是否可用
    if server_available then
        -- 判断服务是否准备就绪，若就绪则启动服务
        server:on_ready(
            function()
                -- keybind
                server_options.on_attach = on_attach
                -- options config
                server_options.flags = {
                    debounce_text_changes = 150
                }
                -- if server_name == "jdtls" then
                --     require('jdtls').start_or_attach(server_options)
                -- else
                    -- 启动服务
                    server:setup(server_options)
                -- end
            end
        )
        -- 如果服务器没有下载，则通过 notify 插件弹出下载提示
        if not server:is_installed() then
            vim.notify("Install Language Server : " .. server_name, "WARN", {title = "Language Servers"})
            server:install()
        end
    end
end

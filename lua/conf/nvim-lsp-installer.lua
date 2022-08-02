-- https://github.com/williamboman/nvim-lsp-installer
local lsp_installer_servers = require("nvim-lsp-installer.servers")
-- WARN: 手动书写 LSP 配置文件
-- 名称：https://github.com/williamboman/nvim-lsp-installer#available-lsps
-- 配置：https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    -- 语言服务器名称：配置选项
    -- rust_analyzer = require("lsp.rust_analyzer"),
    -- jdtls = require("lsp.jdtls"),
    -- clangd = require("lsp.clangd"),
    -- gopls = require("lsp.gopls"),
    sumneko_lua = require("lsp.sumneko_lua"),
    pyright = require("lsp.pyright"),
    volar = require("lsp.volar"),
    tsserver = require("lsp.tsserver"),
    jsonls = require("lsp.jsonls"),
    cssls = require("lsp.cssls"),
    html = require("lsp.html"),
    sqls = require("lsp.sqls"),
}

-- 使用 cmp_nvim_lsp 代替内置 omnifunc，获得更强的补全体验
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- 自动安装或启动 LanguageServers
for server_name, server_options in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    -- 判断服务是否可用
    if server_available then
        -- 判断服务是否准备就绪，若就绪则启动服务
        server:on_ready(
            function()
                -- 代替内置 omnifunc
                server_options.capabilities = capabilities
                -- 启动服务
                server:setup(server_options)
            end
        )
        -- 如果服务器没有下载，则通过 notify 插件弹出下载提示
        if not server:is_installed() then
            vim.notify("Install Language Server : " .. server_name, "WARN", { title = "Language Servers" })
            server:install()
        end
    end
end

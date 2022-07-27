-- https://github.com/ray-x/go.nvim

local go = require('go')
go.setup({})

local lsp_installer_servers = require 'nvim-lsp-installer.servers'

local available, server = lsp_installer_servers.get_server("gopls")
if available then
    server:on_ready(
        function()
            local opts = vim.tbl_deep_extend("force", require('go.lsp'), require('lsp.gopls'))
            server:setup(opts)
        end

    )
    if not server:is_installed() then
        vim.notify("Installing gopls...")
        server:install()
    end
end

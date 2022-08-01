-- https://github.com/simrat39/rust-tools.nvim

local extension_path = vim.env.HOME .. '/.local/share/nvim/dapinstall/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local system = io.popen("uname -s"):read("*l")
local liblldb_path = ""
if system == "Darwin" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
elseif system == "Linux" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
elseif system == "Linux" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.dll'
end

local lsp_installer_servers = require("nvim-lsp-installer.servers")
local flag, server = lsp_installer_servers.get_server("rust_analyzer")
if flag then
    server:on_ready(
        function()
            require('rust-tools').setup({
                server = vim.tbl_deep_extend("force", server:get_default_options(), require("lsp.rust_analyzer")),
                dap = {
                    adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
                }
            })
            -- server:attach_buffers()
            -- require("rust-tools").start_standalone_if_required()
        end
    )
    if not server:is_installed() then
        vim.notify("Installing rust_analyzer...")
        server:install()
    end
end

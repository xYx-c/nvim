--https://github.com/mrcjkb/rustaceanvim
-- https://github.com/lvimuser/lsp-inlayhints.nvim

vim.g.rustaceanvim = function()
    local mason_registry = require('mason-registry')
    local extension_path = mason_registry.get_package('codelldb'):get_install_path() .. '/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb'

    -- local this_os = vim.uv.os_uname().sysname;
    local system = io.popen("uname -s"):read("*l")
    if system == "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    else
        liblldb_path = liblldb_path .. (system == "Linux" and ".so" or ".dylib")
    end

    local cfg = require('rustaceanvim.config')
    return {
        -- tools = {},
        server = {
            on_attach = function(client, bufnr)
                require("keybinds").lsp_maps(client, bufnr)
                vim.cmd [[command! -buffer RustDebuggables execute "lua vim.cmd.RustLsp { 'debuggables', 'bang=true' }"]]
                vim.cmd [[command! -buffer RustRunnables execute "lua vim.cmd.RustLsp { 'runnables', 'bang=true' }"]]
            end,
        },
        dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
    }
end

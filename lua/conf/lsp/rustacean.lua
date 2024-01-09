--https://github.com/mrcjkb/rustaceanvim
-- https://github.com/lvimuser/lsp-inlayhints.nvim

vim.g.rustaceanvim = function()
    local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb'
    local system = io.popen("uname -s"):read("*l")
    if system == "Windows" then
        codelldb_path = extension_path .. "adapter\\codelldb.exe"
        liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
    else
        -- The liblldb extension is .so for Linux and .dylib for MacOS
        liblldb_path = liblldb_path .. (system == "Linux" and ".so" or ".dylib")
    end
    local cfg = require('rustaceanvim.config')
    return {
        -- tools = {},
        server = {
            on_attach = function(client, bufnr)
                require("lsp-inlayhints").on_attach(client, bufnr)
                require("keybinds").lsp_maps(client, bufnr)
                -- vim.keymap.set('n', '\\', function() vim.cmd.RustLsp { 'debuggables', 'last' --[[ optional ]] } end,
                --     { silent = true, buffer = bufnr })
            end,
        },
        dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
        },
    }
end

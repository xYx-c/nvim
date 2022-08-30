-- https://github.com/simrat39/rust-tools.nvim

local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
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

local opts = {
    server = {
        standalone = false,
    },
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    }
}

return opts

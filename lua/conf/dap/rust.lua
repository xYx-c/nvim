-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode

local extension_path = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local system = io.popen("uname -s"):read("*l")
local liblldb_path = ""
if system == "Darwin" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'
elseif system == "Linux" then
    liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
else
    liblldb_path = extension_path .. 'lldb/lib/liblldb.dll'
end

local function get_binary_executables(directory)
    if vim.fn.isdirectory(directory) == 0 then return {} end
    local binary_files = {}
    local handle = io.popen('ls -p ' .. directory)
    if handle == nil then return binary_files end
    local files = handle:read("*a")
    handle:close()
    for file in string.gmatch(files, "[^\n]+") do
        local full_path = directory .. '/' .. file
        if vim.fn.isdirectory(full_path) == 0 and vim.fn.executable(full_path) == 1 then
            table.insert(binary_files, file)
        end
    end
    return binary_files
end

local current_directory = vim.api.nvim_call_function('expand', { '%:p:h' })
local rust_programs = get_binary_executables(current_directory .. "/target/debug")

local configurations = {}
for _, program in ipairs(rust_programs) do
    table.insert(configurations, {
        name = program,
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/" .. program,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    })
end

return {
    adapter = {
        type = 'server',
        port = "${port}",
        executable = {
            -- command = vim.env.HOME .. '/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',
            command = codelldb_path,
            args = { "--liblldb", liblldb_path, "--port", "${port}" },
            -- On windows you may have to uncomment this:
            -- detached = false,
        },
    },
    configurations = configurations

}

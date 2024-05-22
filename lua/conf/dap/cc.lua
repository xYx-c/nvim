-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode

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
local cc_programs = get_binary_executables(current_directory .. "/build/linux/x86_64/release")

local configurations = {}
for _, program in ipairs(cc_programs) do
    table.insert(configurations, {
        name = program,
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/build/linux/x86_64/release/" .. program,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    })
end


return {
    configurations = configurations

}

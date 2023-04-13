-- pacman -S delve
-- go install github.com/go-delve/delve/cmd/dlv@latest

return {
    adapter = {
        type = 'server',
        port = '${port}',
        executable = {
            command = 'dlv',
            args = { 'dap', '-l', '127.0.0.1:${port}' },
        }
    },
    configurations = {
        {
            type = "delve",
            name = "Debug",
            request = "launch",
            program = "${file}"
        },
        {
            type = "delve",
            name = "Debug test", -- configuration for debugging test files
            request = "launch",
            mode = "test",
            program = "${file}"
        },
        -- works with go.mod packages and sub packages
        {
            type = "delve",
            name = "Debug test (go.mod)",
            request = "launch",
            mode = "test",
            program = "./${relativeFileDirname}"
        }
    }
}

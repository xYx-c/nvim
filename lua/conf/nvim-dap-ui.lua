-- https://github.com/rcarriga/nvim-dap-ui

local dap = require("dap")
local dapui = require("dapui")
-- 初始化调试界面
dapui.setup(
    {
        sidebar = {
            -- dapui 的窗口设置在右边
            -- Provide as ID strings or tables with "id" and "size" keys
            -- Can be float or integer > 1
            position = "right",
            elements = {
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.2 },
                { id = "watches", size = 0.55 },
                -- { id = "repl", size = 0.55 },
            },
            size = 80,
        },
        tray = {
            elements = {
                { id = "scopes", size = 1.0 },
            },
            size = 12,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
        },
        -- floating = {
        --     max_height = 0.25, -- These can be integers or a float between 0 and 1.
        --     max_width = nil, -- Floats will be treated as percentage of your screen.
        --     border = "single", -- Border style. Can be "single", "double" or "rounded"
        -- },
        -- windows = { indent = 1 },
        -- render = {
        --     max_type_length = nil, -- Can be integer or nil.
        -- }
    }
)
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end
-- 显示或隐藏调试界面
vim.keybinds.gmap("n", "<F11>", "<cmd>lua require'dapui'.toggle()<CR>", vim.keybinds.opts)


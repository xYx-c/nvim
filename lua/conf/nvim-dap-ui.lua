-- https://github.com/rcarriga/nvim-dap-ui

local dap = require("dap")
local dapui = require("dapui")
-- 初始化调试界面
dapui.setup(
    {
        layouts = {
            {
                elements = {
                    -- Elements can be strings or table with id and size keys.
                    { id = "breakpoints", size = 0.25 },
                    { id = "stacks", size = 0.2 },
                    -- { id = "watches", size = 0.55 },
                    { id = "repl", size = 0.55 },
                },
                size = 55,
                position = "right",
            },
            {
                elements = {
                    -- "repl",
                    "console",
                },
                size = 10,
                position = "bottom",
            },
        },
    }
)
-- 如果开启或关闭调试，则自动打开或关闭调试界面
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
    -- dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    -- dap.repl.close()
end
-- 显示或隐藏调试界面
vim.keybinds.gmap("n", "<F11>", "<cmd>lua require('dapui').toggle()<CR>", vim.keybinds.opts)

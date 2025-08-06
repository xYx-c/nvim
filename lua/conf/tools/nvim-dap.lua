-- https://github.com/mfussenegger/nvim-dap

local dap = require("dap")
dap.adapters.codelldb = require("conf.dap.rust").adapter
dap.adapters.delve = require("conf.dap.go").adapter
dap.adapters.python = require("conf.dap.python").adapter

-- 加载调试器配置
local dap_config = {
    -- rust = require("conf.dap.rust"),
    go = require("conf.dap.go"),
    python = require("conf.dap.python"),
    -- java = require("conf.dap.java"),
}
-- 设置调试器
for dap_name, dap_options in pairs(dap_config) do
    dap.configurations[dap_name] = dap_options.configurations
end

local dapui = require("dapui")
-- 初始化调试界面
dapui.setup({
    icons = { expanded = "", collapsed = "", current_frame = "" },
    layouts = {
        {
            elements = {
                -- "repl",
                "console",
            },
            size = 0.25,
            position = "bottom",
        },
        {
            elements = {
                -- Elements can be strings or table with id and size keys.
                -- { id = "scopes", size = 0.55 },
                -- { id = "breakpoints", size = 0.15 },
                -- { id = "stacks", size = 0.1 },
                -- { id = "watches", size = 0.2 },
                -- { id = "repl", size = 0.2 },
            },
            size = 0.2,
            position = "right",
        },
    },
})
-- 如果开启或关闭调试，则自动打开或关闭调试界面
-- dap.listeners.after.event_initialized["dapui_config"] = function()
--     dapui.open()
-- end
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
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

require "nvim-dap-virtual-text".setup {}

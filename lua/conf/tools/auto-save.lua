-- https://github.com/Pocco81/AutoSave.nvim

require("auto-save").setup(
    {
        enabled = true,
        -- 触发自动保存的事件（退出插入模式或者普通模式下文本内容发生改变）
        trigger_events = { "InsertLeave", "TextChanged" },
        -- 自动保存时的提示信息
        execution_message = {
            message = function() -- message to print on save
                return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
            end,
            dim = 0.18, -- dim the color of `message`
            cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
        },
        condition = function(buf)
            local fn = vim.fn
            local utils = require("auto-save.utils.data")
            if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
                return true -- met condition(s), can save
            end
            return false -- can't save
        end,
        -- 保存时写入全部的 Buffer
        write_all_buffers = false,
        on_off_commands = false,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

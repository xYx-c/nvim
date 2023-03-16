-- https://github.com/rcarriga/nvim-notify

local notify_opts = {
    -- background_colour = "#282727",
    -- 动画样式
    -- fade_in_slide_out
    -- fade
    -- slide
    -- static
    stages = "fade",
    -- max_width = 60,

    -- 超时时间，默认 5s
    -- timeout = 5000
}

-- 如果是透明背景，则需要设置背景色
-- if vim.u.background_transparency then
--     notify_opts.background_colour = "#ffffff"
-- end

vim.notify = require("notify")
vim.notify.setup(notify_opts)
-- 使用案例：
-- 信息、级别、标题
-- 级别有：info、warn、error、debug、trace
-- 示例：
-- vim.notify("hello world", "info", {title = "info"})

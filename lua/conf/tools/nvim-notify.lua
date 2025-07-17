-- https://github.com/rcarriga/nvim-notify

local background = function ()
    local colors = require("gruvbox").palette
    if vim.o.background == "dark" then
        return colors.dark0
    else
        return colors.light0
    end
end

local notify_opts = {
    render = "wrapped-compact",
    background_colour = background(),
    -- 动画样式
    -- fade_in_slide_out
    -- fade
    -- slide
    -- static
    stages = "fade",
    max_width = 80,

    -- 超时时间，默认 5s
    -- timeout = 5000
}

vim.notify = require("notify")
vim.notify.setup(notify_opts)


-- 使用案例：
-- 信息、级别、标题
-- 级别有：info、warn、error、debug、trace
-- 示例：
-- vim.notify("hello world", "info", {title = "info"})

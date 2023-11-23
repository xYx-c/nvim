-- https://github.com/numToStr/Comment.nvim
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring

require("Comment").setup({
    toggler = {
        -- 切换行注释
        line = "gcc",
        --- 切换块注释
        block = "gbc"
    },
    opleader = {
        -- 可视模式下的行注释
        line = "gc",
        -- 可视模式下的块注释
        block = "gb"
    },
    extra = {
        -- 在当前行上方新增行注释
        above = "gcO",
        -- 在当前行下方新增行注释
        below = "gco",
        -- 在当前行行尾新增行注释
        eol = "gcA"
    },
    -- 根据当前光标所在上下文判断不同类别的注释
    -- 由 nvim-ts-context-commentstring  提供
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
})

-- vim.g.skip_ts_context_commentstring_module = true
-- require('ts_context_commentstring').setup {
--     enable_autocmd = false,
-- }

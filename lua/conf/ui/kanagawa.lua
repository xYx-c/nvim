-- https://github.com/rebelot/kanagawa.nvim

require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    dimInactive = false, -- dim inactive window `:h hl-NormalNC`
    globalStatus = false, -- adjust window separators highlight for laststatus=3
    terminalColors = true, -- define vim.g.terminal_color_{0,17}
    colors = {
        -- 状态栏
        -- sumiInk2 = "#1F1F28",
        -- 光标行
        sumiInk3 = '#252535',
    },
    overrides = {},
    theme = "default" -- Load "default" theme or the experimental "light" theme
})

vim.cmd("colorscheme kanagawa")

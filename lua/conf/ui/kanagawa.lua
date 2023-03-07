-- https://github.com/rebelot/kanagawa.nvim

require('kanagawa').setup({
    undercurl = true, -- enable undercurls
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,    -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    -- transparent = true,     -- do not set background color
    dimInactive = false,     -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,    -- adjust window separators highlight for laststatus=3
    terminalColors = true,   -- define vim.g.terminal_color_{0,17}
    colors = {
        palette = {
            -- 状态栏
            -- sumiInk4 = '#1F1F28',
            -- 光标行
            -- sumiInk5 = '#252535',
            sumiInk0 = '#161616',
            sumiInk3 = '#202020',
            sumiInk4 = '#202020',
            sumiInk5 = '#222222',
            waveBlue1 = "#292931",
            waveBlue2 = "#223249",
            dragonBlack4 = '#181616',
            dragonBlack5 = '#1E1C1C',
        },
        theme = {
            all = {},
            wave = {},
            lotus = {},
            dragon = {},
        },
    },
    -- overrides = function() end,
    -- theme = "dragon", -- Load "wave" theme when 'background' option is not set
    -- theme = "lotus", -- Load "wave" theme when 'background' option is not set
})

vim.cmd("colorscheme kanagawa")

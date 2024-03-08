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
            -- 行号
            -- sumiInk4 = '#1F1F28',
            -- 光标行
            -- sumiInk5 = '#252535',
            -- falot bg
            sumiInk0 = '#202020',
            -- 背景
            sumiInk3 = '#282727',
            sumiInk4 = '#282727',
            sumiInk5 = '#2F2D2D',
            -- waveBlue1 = "#323235",
            -- waveBlue2 = "#223249",
            dragonBlack4 = '#181616',
            dragonBlack5 = '#1E1C1C',
        },
        theme = {
            all = {},
            wave = {
                syn = {
                    -- string     = '#6f894e',
                    -- variable   = "none",
                    -- number     = '#b35b79',
                    -- constant   = '#cc6d00',
                    -- identifier = '#77713f',
                    -- parameter  = '#5d57a3',
                    -- fun        = '#4d699b',
                    -- statement  = '#624c83',
                    -- keyword    = '#624c83',
                    -- operator   = '#836f4a',
                    -- preproc    = '#c84053',
                    -- type       = '#597b75',
                    -- regex      = '#836f4a',
                    -- deprecated = '#8a8980',
                    -- comment    = '#8a8980',
                    -- punct      = '#4e8ca2',
                    -- special1   = '#6693bf',
                    -- special2   = '#c84053',
                    -- special3   = '#c84053',
                },
            },
            lotus = {},
            dragon = {},
        },
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
        }
    end,
    -- theme = "dragon", -- Load "wave" theme when 'background' option is not set
    -- theme = "lotus", -- Load "wave" theme when 'background' option is not set
})

vim.cmd("colorscheme kanagawa")

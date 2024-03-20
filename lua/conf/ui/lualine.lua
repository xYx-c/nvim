-- https://github.com/nvim-lualine/lualine.nvim
local colors = {
    blue   = '#80a0ff',
    cyan   = '#6A9589',
    black  = '#202020',
    white  = '#c6c6c6',
    red    = '#ff5189',
    -- violet = '#d183e8',
    violet = '#957FB8',
    grey   = '#303030',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },
    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}
-- local gruvbox = require 'lualine.themes.gruvbox'

require('lualine').setup {
    options = {
        theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            -- { 'mode', separator = { left = '' }, right_padding = 2 },
            { 'mode', right_padding = 2 },
        },
        lualine_b = {
            'filename',
            -- 'diff',
            'branch',
            'diagnostics'
        },
        -- lualine_c = { 'fileformat' },
        lualine_c = { '' },
        lualine_x = {},
        lualine_y = { 'encoding',
            {
                'lsp_progress',
                separators = {
                    component = ' ',
                    progress = ' | ',
                    percentage = { pre = '', post = '%% ' },
                    title = { pre = '', post = ': ' },
                    lsp_client_name = { pre = '[', post = ']' },
                    spinner = { pre = '', post = '' },
                    use = true,
                    message = { pre = '(', post = ')', commenced = 'In Progress', completed = 'Completed' },
                },
                display_components = { 'lsp_client_name', 'spinner', { 'title', 'percentage', 'message' } },
                timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
            },
            'filetype',
            'progress',
        },
        lualine_z = {
            -- { 'location', separator = { right = '' }, left_padding = 2 },
            { 'location', left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
    },
    tabline = {},
    extensions = {},
}

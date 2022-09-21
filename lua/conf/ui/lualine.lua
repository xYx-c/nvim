-- https://github.com/nvim-lualine/lualine.nvim

require('lualine').setup {
    options = {
        -- theme = 'gruvbox-flat',
        component_separators = { right = '|' },
        globalstatus = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
}

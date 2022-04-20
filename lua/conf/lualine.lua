-- local custom_gruvbox = require 'lualine.themes.gruvbox'

require('lualine').setup {
    options = {
        -- theme = custom_gruvbox,
        theme = "catppuccin",
        component_separators = { right = '|' }
    },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

local wezterm = require 'wezterm'

return {
    font = wezterm.font_with_fallback {
        'DroidSansMono Nerd Font Mono',
        'Fira Code',
        'DengXian',
    },
    font_size = 12,
    cell_width = 0.8,
    color_scheme = "Gruvbox Dark",
    hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    window_padding = {
        left = 2,
        right = 2,
        top = 0,
        bottom = 0,
    },
}

-- https://github.com/ellisonleao/glow.nvim

-- https://github.com/charmbracelet/glow

-- brew install glow
-- or
-- git clone ... && cd glow && go build

require('glow').setup({
    glow_install_path = "/usr/local/bin/glow",
    style = "dark",
    -- border = "double",
    border = "single",
    width = 120,
})

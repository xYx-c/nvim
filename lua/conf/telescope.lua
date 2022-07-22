-- https://github.com/nvim-telescope/telescope.nvim
-- WARN: telescope 手动安装依赖 fd 和 repgrep
-- https://github.com/sharkdp/fd
-- Debian
-- sudo apt-get install fd-find

-- macOS
-- brew install fd
-- https://github.com/BurntSushi/ripgrep
require("telescope").setup({
    pickers = {
        find_files = {
            theme = "dropdown",
        }
    },
})

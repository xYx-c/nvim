---@diagnostic disable: missing-fields
-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/yioneko/nvim-yati

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "rust", "java", "go", "lua", "vue", "javascript", "css", "scss", "html", "tsx",
        "typescript", "toml", "json", "yaml", "http", "vim" },
    -- auto_install = true,
    indent = {
        enable = true
    },
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        disable = function(_, buf)
            local max_filesize = 200 * 1024 -- 200 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your edit, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    -- 缩进
    -- yati = { enable = true },
}

-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/yioneko/nvim-yati

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "rust", "java", "sql", "go", "lua", "vue", "javascript", "css", "html", "tsx",
        "typescript", "toml", "json", "yaml", "http" },

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
        -- additional_vim_regex_highlighting = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
        -- config = {
        --     tsx = {
        --         __default = '// %s',
        --         __multiline = '/* %s */',
        --         jsx_element = '// %s',
        --         jsx_fragment = '{/* %s */}',
        --         jsx_attribute = { __default = '// %s', __multiline = '/* %s */' },
        --         comment = { __default = '// %s', __multiline = '/* %s */' },
        --         call_expression = { __default = '// %s', __multiline = '/* %s */' },
        --         statement_block = { __default = '// %s', __multiline = '/* %s */' },
        --         spread_element = { __default = '// %s', __multiline = '/* %s */' },
        --     },
        -- }
    },
    yati = { enable = true },
}

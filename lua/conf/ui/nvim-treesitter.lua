-- https://github.com/nvim-treesitter/nvim-treesitter

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "rust", "java", "sql", "go", "lua", "vue", "javascript", "css", "html", "tsx",
        "typescript", "toml", "json", "yaml" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your edit, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
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
    }
}

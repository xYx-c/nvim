-- https://github.com/nvim-treesitter/nvim-treesitter

require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "cpp", "go", "lua", "rust", "java", "vue", "javascript", "css", "html", "tsx", "typescript", "toml", "json", "yaml" },

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
        enable = true
    }
}

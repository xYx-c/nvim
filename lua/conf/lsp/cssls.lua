local opts = {
    filetypes = { "css", "scss", "less", "wxss" },
    settings = {
        scss = {
            lint = { unknownAtRules = 'ignore' }
        },
        less = {
            lint = { unknownAtRules = 'ignore' }
        },
        css = {
            lint = { unknownAtRules = 'ignore' }
        }
    }
}
return opts

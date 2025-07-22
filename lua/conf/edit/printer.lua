-- https://github.com/rareitems/printer.nvim


require('printer').setup({
    keymap = "gp",
    formatters = {
        vue = function(inside, variable)
            return string.format('console.log("%s: ", %s);', inside, variable)
        end,
        typescriptreact = function(inside, variable)
            return string.format('console.log("%s: ", %s);', inside, variable)
        end,
        typescript = function(inside, variable)
            return string.format('console.log("%s: ", %s);', inside, variable)
        end,
        javascriptreact = function(inside, variable)
            return string.format('console.log("%s: ", %s);', inside, variable)
        end,
        javascript = function(inside, variable)
            return string.format('console.log("%s: ", %s);', inside, variable)
        end,
        rust = function(inside, variable)
            return string.format('println!("%s: {%s}");', inside, variable)
        end
    },
    add_to_inside = function(text)
        return text
    end,
})

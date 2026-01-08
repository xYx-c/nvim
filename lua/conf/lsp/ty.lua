-- https://github.com/astral-sh/ty

local opts = {
    settings = {
        ty = {
            inlayHints = {
            },
            configuration = {
                rules = {
                    ["unresolved-reference"] = "warn"
                }
            }
        },
    }
}

return opts

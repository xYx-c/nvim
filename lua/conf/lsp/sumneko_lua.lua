local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
return {
    -- 比如这里修改成了中文提示信息，具体语言服务器是否支持中文提示还需要查看该语言服务器的配置项
    -- cmd = {"lua-language-server", "--locale=zh-CN"},
    root_dir = function()
        return vim.fn.getcwd()
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path
            },
            diagnostics = {
                globals = { "vim" }
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true)
            },
            telemetry = {
                enable = false
            }
        }
    },
    on_attach = function (client, bufnr)
        require('keybinds').lsp_maps(client, bufnr)
    end,

}

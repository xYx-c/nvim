local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

-- local utils = require("luasnip_snippets.utils")
local function package_str()
    return  "package " .. string.gsub(string.match(vim.fn.expand('%'), "/src/main/java/(.*)/.*java"), "/", ".") .. ";"
end
-- local package_str = "package " .. string.gsub(string.match(vim.fn.expand('%'), "/src/main/java/(.*)/.*java"), "/", ".") .. ";"
-- local function file_base_name()
--     return vim.fn.expand('%:t:r')
-- end
local file_base_name = vim.fn.expand('%:t:r')

return {
    s("clas", {
        f(function (_, snip)
            return "package " .. string.gsub(string.match(snip.env.TM_FILEPATH, "/src/main/java/(.*)/.*java"), "/", ".") .. ";"
        end, {}),
        t({ "", "", "" }),
        t({ "/**", "" }),
        t({ " * @author: xYx", "" }),
        t({ " * @date: " .. os.date("%Y-%m-%d %H:%M:%S"), "" }),
        t({ " */", "" }),
        -- t({ "public class " .. file_base_name .. " {" }),
        f(function (_, snip)
            return "public class " .. snip.env.TM_FILENAME_BASE .. " {"
        end, {}),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
    s("iface", {
        f(function (_, snip)
            return "package " .. string.gsub(string.match(snip.env.TM_FILEPATH, "/src/main/java/(.*)/.*java"), "/", ".") .. ";"
        end, {}),
        t({ "", "", "" }),
        t({ "/**", "" }),
        t({ "* @author: xYx", "" }),
        t({ "* @date: " .. os.date("%Y-%m-%d %H:%M:%S"), "" }),
        t({ "*/", "" }),
        -- t({ "public interface " .. file_base_name .. " {" }),
        f(function (_, snip)
            return "public interface " .. snip.env.TM_FILENAME_BASE .. " {"
        end, {}),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
    s("enu", {
        f(function (_, snip)
            return "package " .. string.gsub(string.match(snip.env.TM_FILEPATH, "/src/main/java/(.*)/.*java"), "/", ".") .. ";"
        end, {}),
        t({ "", "", "" }),
        t({ "/**", "" }),
        t({ "* @author: xYx", "" }),
        t({ "* @date: " .. os.date("%Y-%m-%d %H:%M:%S"), "" }),
        t({ "*/", "" }),
        -- t({ "public enum " .. file_base_name .. " {" }),
        f(function (_, snip)
            return "public enum " .. snip.env.TM_FILENAME_BASE .. " {"
        end, {}),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
}

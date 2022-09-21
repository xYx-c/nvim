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

local package_str = "package " .. string.gsub(string.match(vim.fn.expand('%:p'), "/src/main/java/(.*)/.*java"), "/", ".") .. ";"
local file_base_name = vim.fn.expand('%:t:r')

return {
    s("clas", {
        t(package_str),
        t({ "", "", "" }),
        t({ "/**", "" }),
        t({ "* @author: xYx", "" }),
        t({ "* @date: " .. os.date("%Y-%m-%d %H:%M:%S"), "" }),
        t({ "*/", "" }),
        t({ "public class " .. file_base_name .. " {" }),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
    s("iface", {
        t(package_str),
        t({ "", "", "" }),
        t({ "/**", "" }),
        t({ "* @author: xYx", "" }),
        t({ "* @date: " .. os.date("%Y-%m-%d %H:%M:%S"), "" }),
        t({ "*/", "" }),
        t({ "public interface " .. file_base_name .. " {" }),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
    s("enu", {
        t(package_str),
        t({ "", "", "" }),
        t({ "/**", "" }),
        t({ "* @author: xYx", "" }),
        t({ "* @date: " .. os.date("%Y-%m-%d %H:%M:%S"), "" }),
        t({ "*/", "" }),
        t({ "public enum " .. file_base_name .. " {" }),
        t({ "", "\t" }),
        i(0),
        t({ "", "}" }),
    }),
}

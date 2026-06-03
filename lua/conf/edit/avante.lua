-- https://github.com/yetone/avante.nvim

-- local function read_skill(name)
--     local path = vim.fn.stdpath("config") .. "/avante/skills/" .. name .. ".md"
--     local lines = vim.fn.readfile(path)
--     return table.concat(lines, "\n")
-- end

require("avante").setup({
    provider = "home",
    providers = {
        home = {
            __inherited_from = "openai",
            endpoint = "http://ionmm.com:8317/v1",
            -- model = "claude",
            -- model = "gemini",
            model = "codex",
            api_key_name = "HOME_API_KEY",
        },
    },
    acp_providers = {
        ["gemini-cli"] = {
            command = "gemini",
            args = { "--experimental-acp" },
            env = {
                NODE_NO_WARNINGS = "1",
                GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
            },
        },
    },
    system_prompt = function()
        local hub = require("mcphub").get_hub_instance()
        local mcp_prompt = ""
        if hub then mcp_prompt = hub:get_active_servers_prompt() end
        return mcp_prompt .. [[
            # Coding Style Rules
            Add simplified Chinese comments to the classes, functions, and methods you write.
            Requirements:
            - Use concise and clear Simplified Chinese.
            - Avoid lengthy explanations.
            - Focus on purpose and behavior.
            - Only comment public APIs, classes, functions, and methods.
            - Do not comment every line of code.
        ]]
    end,
    -- shortcuts = {},
    override_prompt_dir = function()
        return vim.fn.stdpath("config") .. "/avante"
    end,
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
    -- disabled_tools = {
    --     "list_files",
    --     "search_files",
    --     "read_file",
    --     "create_file",
    --     "rename_file",
    --     "delete_file",
    --     "create_dir",
    --     "rename_dir",
    --     "delete_dir",
    -- },
    -- behaviour = {
    --     auto_approve_tool_permissions = false,
    -- },
})

require("mcphub").setup({
    auto_approve = true,
    -- extensions = {
    --     avante = {
    --         make_slash_commands = true,
    --     }
    -- },
})

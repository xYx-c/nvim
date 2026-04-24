-- https://github.com/yetone/avante.nvim
-- https://text.pollinations.ai/models

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
        return hub and hub:get_active_servers_prompt() or ""
    end,
    custom_tools = function()
        return {
            require("mcphub.extensions.avante").mcp_tool(),
        }
    end,
    disabled_tools = {
        "list_files",
        "search_files",
        "read_file",
        "create_file",
        "rename_file",
        "delete_file",
        "create_dir",
        "rename_dir",
        "delete_dir",
    },
    -- behaviour = {
    --     auto_approve_tool_permissions = false,
    -- },
})

require("mcphub").setup({
    auto_approve = true,
    extensions = {
        avante = {
            make_slash_commands = true,
        }
    },
})

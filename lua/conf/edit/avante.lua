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
    behaviour = {
        auto_approve_tool_permissions = false,
    },
})

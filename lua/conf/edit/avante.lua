-- https://github.com/yetone/avante.nvim
-- https://text.pollinations.ai/models

require("avante").setup({
    provider = "pollinations",
    providers = {
        pollinations = {
            __inherited_from = "openai",
            endpoint = "https://text.pollinations.ai/openai",
            model = "gemini",
            api_key_name = "POLLINATIONS_API_KEY",
        },
        morph = {
            model = "morph-v3-large",
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
    -- windows = {
    --     input = {
    --         prefix = "🤖",
    --     },
    -- },
})

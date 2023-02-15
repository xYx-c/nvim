-- https://github.com/potamides/pantran.nvim
require("pantran").setup {
    -- "apertium", "argos", "deepl", "google", and "yandex". Default is "argos"
    default_engine = "yandex",
    -- Configuration for individual engines goes here.
    engines = {
        argos = {
            default_target = "zh",
        },
        yandex = {
            default_target = "zh"
        },
        google = {
            default_target = "zh"
        },
    },
}

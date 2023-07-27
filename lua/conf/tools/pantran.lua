-- https://github.com/potamides/pantran.nvim

require('pantran').setup {
    default_engine = "google",
    engines = {
        google = {
            fallback = {
                default_source = "auto",
                default_target = "zh-CN",
            }
        },
        yandex = {
            fallback = {
                default_source = "auto",
                default_target = "zh",
            }
        },
        argos = {
            default_source = "auto",
            default_target = "zh",
        },
    },
}

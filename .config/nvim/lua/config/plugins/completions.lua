return {
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },

        version = "*",

        opts = {
            completion = {
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = false,
                    },
                },

                accept = {
                    auto_brackets = {
                        enabled = true,
                    },
                },

                menu = {
                    draw = {
                        -- We don't need label_description now because label and label_description are already
                        -- combined together in label by colorful-menu.nvim.
                        columns = { { "kind_icon" }, { "label", gap = 1 } },
                        components = {
                            label = {
                                text = function(ctx)
                                    return require("colorful-menu").blink_components_text(ctx)
                                end,
                                highlight = function(ctx)
                                    return require("colorful-menu").blink_components_highlight(ctx)
                                end,
                            },
                        },
                    },
                },

                ghost_text = {
                    enabled = false,
                },
            },

            fuzzy = {
                implementation = "prefer_rust",
                prebuilt_binaries = {
                    download = true,
                },
            },

            keymap = {
                preset = "default",
            },

            signature = {
                enabled = true,

                trigger = {
                    show_on_insert = true,
                    show_on_keyword = true,
                },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = "mono",
            },
        },
    },
}

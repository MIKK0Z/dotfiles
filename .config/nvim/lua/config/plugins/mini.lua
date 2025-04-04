return {
    {
        "echasnovski/mini.nvim",
        config = function()
            local statusline = require("mini.statusline")
            statusline.setup({ use_icons = true })

            local files = require("mini.files")
            files.setup()

            local clue = require("mini.clue")
            clue.setup({
                triggers = {
                    { mode = "n", keys = "<Leader>" },
                    { mode = "n", keys = "g" },
                },

                clues = {
                    clue.gen_clues.g(),
                    {
                        mode = "n",
                        keys = "<Leader>f",
                        desc = "telescope stuff",
                    },
                    {
                        mode = "n",
                        keys = "<Leader>ff",
                        desc = "fzf working dir",
                    },
                    {
                        mode = "n",
                        keys = "<Leader>fg",
                        desc = "grep working dir",
                    },
                    {
                        mode = "n",
                        keys = "<Leader>fh",
                        desc = "fzf help",
                    }
                },
            })
        end
    }
}

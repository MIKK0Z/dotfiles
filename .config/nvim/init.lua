vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

vim.opt.clipboard = "unnamedplus"

vim.cmd.colorscheme("catppuccin-macchiato")

vim.opt.number = true
vim.opt.relativenumber = true

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

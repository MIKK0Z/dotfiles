vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")
--require("mason").setup()

vim.cmd.colorscheme("catppuccin-macchiato")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":lua<CR>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "-", ":lua MiniFiles.open()<CR>")

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<space>tt", ":Floaterminal<CR>")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Disable line numbers in terminal mode",
    group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
    callback = function()
        vim.opt.number = false
        vim.opt.relativenumber = false
    end,
})

-- https://www.youtube.com/watch?v=ooTcnx066Do
vim.keymap.set("n", "<space>st", function()
    vim.cmd.new()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 15)
    vim.cmd.startinsert()
end)

local opt = vim.opt
opt.tabstop = 4
opt.number = true
opt.relativenumber = true

local keymap = vim.keymap.set
keymap("n", "<C-n>", ":edit ./<CR>")

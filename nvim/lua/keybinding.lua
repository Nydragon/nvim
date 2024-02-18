local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ","

keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
keymap("n", "<S-C-p>", ":Telescope<CR>", opts)

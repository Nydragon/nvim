vim.o.showmatch = true

vim.wo.number = true
vim.wo.relativenumber = true

vim.o.mouse = "a"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.cursorline = true

-- Enable auto-indentation
vim.o.autoindent = true

-- Highlight search results
vim.o.hlsearch = true

-- Highlight current line
vim.o.cursorline = true

-- Increase speed for terminals
vim.o.ttyfast = true

vim.g.nvim_tree_respect_buf_cwd = 1

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.g.updatetime = 300

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.g.signcolumn = "yes"

vim.g.mapleader = " "

vim.o.clipboard = "unnamedplus"

vim.filetype.add({
	pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

require("plugins")

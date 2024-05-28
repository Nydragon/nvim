vim.o.nocompatible = true
vim.o.showmatch = true

vim.wo.number = true
vim.wo.relativenumber = true

-- Set background color for ColorColumn
vim.o.cc = 80
vim.api.nvim_exec(
	[[
  hi ColorColumn ctermbg=black guibg=black
]],
	false
)

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

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
	[[
  autocmd! TextYankPost * silent! lua vim.highlight.on_yank()
]],
	false
)

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option("updatetime", 300)

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})

vim.cmd("set signcolumn=yes")
-- Enable filetype plugins
vim.cmd("filetype plugin on")

vim.g.mapleader = " "
vim.o.termguicolors = 1

vim.api.nvim_set_option("clipboard", "unnamedplus")

require("plugins")

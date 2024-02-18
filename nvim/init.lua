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

-- Set completion options
vim.o.completeopt = "menu,menuone,noselect"

-- Highlight search results
vim.o.hlsearch = true

-- Highlight current line
vim.o.cursorline = true

-- Increase speed for terminals
vim.o.ttyfast = true

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
	[[
  autocmd! TextYankPost * silent! lua vim.highlight.on_yank()
  autocmd! BufWritePost * FormatWrite
]],
	false
)

-- Enable filetype plugins
vim.cmd("filetype plugin on")

require("plugins")

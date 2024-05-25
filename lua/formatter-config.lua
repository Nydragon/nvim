-- https://github.com/mhartington/formatter.nvim/tree/master/lua/formatter/filetypes
local util = require("formatter.util")

local M = {}

local function prettier()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			util.escape_path(util.get_current_buffer_file_path()),
		},
		stdin = true,
		try_node_modules = true,
	}
end

local function build()
	return {
		logging = true,
		log_level = vim.log.levels.WARN,
		filetype = {
			lua = {
				require("formatter.filetypes.lua").stylua,
			},
			rust = {
				function()
					return {
						exe = "rustfmt",
						args = { "--edition 2021" },
						stdin = true,
					}
				end,
			},
			nix = {
				require("formatter.filetypes.nix").nixfmt,
			},
			c = {
				require("formatter.filetypes.c").clangformat,
			},
			cpp = {
				require("formatter.filetypes.cpp").clangformat,
			},
			r = {
				require("formatter.filetypes.r").styler,
			},
			python = {
				require("formatter.filetypes.python").black,
			},
			json = {
				prettier,
			},
			typescript = {
				prettier,
			},
			javascript = {
				prettier,
			},
			yaml = {
				prettier,
			},
			fish = {
				require("formatter.filetypes.fish").fishindent,
			},
			markdown = {
				require("formatter.filetypes.markdown").prettier,
			},
			toml = {
				require("formatter.filetypes.toml").taplo,
			},
			sh = {
				require("formatter.filetypes.sh").shfmt,
			},
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	}
end

M.build = build

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})

return M

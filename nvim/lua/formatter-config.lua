local util = require("formatter.util")

local M = {}

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
			["*"] = {
				require("formatter.filetypes.any").remove_trailing_whitespace,
			},
		},
	}
end

M.build = build

return M

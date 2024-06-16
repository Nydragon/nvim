vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local api = require("nvim-tree.api")

local function open_nvim_tree(data)
	if api.tree.is_visible() then
		return
	end

	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	--local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if not real_file then --and not no_name then
		return
	end

	local path = data.file

	if vim.fn.isdirectory(data.file) == 0 then
		local _, _, i = path:find(".*()/.*")
		path = path:sub(0, i)
	end

	-- open the tree, find the file but don't focus it
	api.tree.toggle({
		focus = false,
		find_file = true,
		path = vim.loop.cwd(),
	})
end

-- Using VimEnter is crucial, other autocmds will break the "focus = false" behaviour
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- From https://github.com/nvim-tree/nvim-tree.lua/issues/1368#issuecomment-1512248492
vim.api.nvim_create_autocmd("QuitPre", {
	callback = function()
		local invalid_win = {}
		local wins = vim.api.nvim_list_wins()
		for _, w in ipairs(wins) do
			local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
			if bufname:match("NvimTree_") ~= nil then
				table.insert(invalid_win, w)
			end
		end
		if #invalid_win == #wins - 1 then
			-- Should quit, so we close all invalid windows.
			for _, w in ipairs(invalid_win) do
				vim.api.nvim_win_close(w, true)
			end
		end
	end,
})

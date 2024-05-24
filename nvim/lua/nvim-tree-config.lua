vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local api = require("nvim-tree.api")

local function open_nvim_tree(data)
	if api.tree.is_visible() then
		return
	end

	vim.notify(vim.loop.cwd())

	-- buffer is a real file on the disk
	local real_file = vim.fn.filereadable(data.file) == 1

	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	if not real_file and not no_name then
		return
	end

	local path = data.file

	if vim.fn.isdirectory(data.file) == 0 then
		local _, _, i = path:find(".*()/.*")
		path = path:sub(0, i)
	end

	-- open the tree, find the file but don't focus it
	api.tree.open({
		focus = false,
		find_file = true,
		path = vim.loop.cwd(),
	})
end

vim.api.nvim_create_autocmd({ "BufAdd" }, { callback = open_nvim_tree })

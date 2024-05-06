vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function open_nvim_tree(data)
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
	require("nvim-tree.api").tree.toggle({
		focus = false,
		find_file = true,
		path = path,
	})
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

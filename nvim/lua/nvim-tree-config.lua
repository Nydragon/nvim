vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()
require'nvim-tree'.toggle(false,true)

--local function open_nvim_tree()

  ---- open the tree
  --require("nvim-tree.api").tree.open()
--end

--vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

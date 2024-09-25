local lsp_zero = require("lsp-zero")
local lspconfig = require("lspconfig")

-- https://lsp-zero.netlify.app/v3.x/language-server-configuration.html

lsp_zero.on_attach(function(_, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

-- set up language servers

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
})

lspconfig.pyright.setup({})

lspconfig.clangd.setup({})

lspconfig.rust_analyzer.setup({})

lspconfig.nil_ls.setup({})

lspconfig.r_language_server.setup({})

--lspconfig.qmlls.setup({})

lspconfig.lua_ls.setup(lsp_zero.nvim_lua_ls())

lspconfig.bashls.setup({})

lspconfig.zls.setup({})

lspconfig.ts_ls.setup({})

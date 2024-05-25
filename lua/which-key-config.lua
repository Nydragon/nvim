local wk = require("which-key")

wk.register({
	t = {
		["1"] = {
			"<Cmd>BufferGoto 1<CR>",
			"Go to Buffer 1",
		},
		d = {
			"<Cmd>BufferClose<CR>",
			"Close Current Buffer",
		},
	},
	f = {
		"Telescope - Finder",
		f = {
			"<cmd>Telescope find_files<CR>",
			"Find File",
		},
		g = {
			"<cmd>Telescope live_grep<CR>",
			"Live Grep",
		},
		b = {
			"<cmd>Telescope buffers<CR>",
			"Find Open Buffers",
		},
		h = {
			"<cmd>Telescope help_tags<CR>",
			"Find Help",
		},
		i = {
			"<cmd>Telescope builtin<cr>",
			"Search all Telescope builtins",
		},
		t = {
			"<cmd>TodoTelescope <cr>",
			"Open Todo in Telescope",
		},
		u = {
			"<cmd>UrlView<cr>",
			"Display and open URLs in current buffer",
		},
	},
	n = {
		"Terminal",
		b = {
			"<cmd>lua _Lazygit_toggle()<CR>",
			"Open Lazygit",
		},
		j = {
			"<cmd>ToggleTerm<CR>",
			"Open Terminal",
		},
	},
	c = {
		"NerdCommenter",
	},
	r = {
		"<cmd>lua vim.lsp.buf.rename()<CR>",
		"Rename a token",
	},
	x = {
		"Toggle Trouble",
		x = {
			"<cmd>TroubleToggle<cr>",
			"Open Trouble",
		},
		w = {
			"<cmd>TroubleToggle workspace_diagnostics<cr>",
			"",
		},
		d = {
			"<cmd>TroubleToggle document_diagnostics<cr>",
			"",
		},
		q = {
			"<cmd>TroubleToggle quickfix<cr>",
			"",
		},
		l = {
			"<cmd>TroubleToggle loclist<cr>",
			"",
		},
		r = {
			"<cmd>TroubleToggle lsp_references<cr>",
			"",
		},
	},
	b = {
		t = {
			"<cmd>BlameToggle virtual<cr>",
			"Toggle Virtual Blame",
		},
	},
}, { prefix = "<leader>" })

wk.register({
	["/"] = {
		"<cmd>Telescope current_buffer_fuzzy_find<cr>",
		"Search for a string in the current buffer",
	},
})

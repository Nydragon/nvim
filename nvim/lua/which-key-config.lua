local wk = require("which-key")

wk.register({
	t = {
		["1"] = {
			"<Cmd>BufferGoto 1<CR>",
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
}, { prefix = "<leader>" })

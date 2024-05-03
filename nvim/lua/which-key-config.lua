local wk = require("which-key")

wk.register({
	f = {
		"Telescope - Finder",
		f = {
			"<cmd>Telescope find_files<cr>",
			"Find File",
		},
		g = {
			"<cmd>Telescope live_grep<cr>",
			"Live Grep",
		},
		b = {
			"<cmd>Telescope buffers<cr>",
			"Find Open Buffers",
		},
		h = {
			"<cmd>Telescope help_tags<cr>",
			"Find Help",
		},
	},
	n = {
		"Terminal",
		b = {
			"<cmd>lua _lazygit_toggle()<CR>",
			"Open Lazygit",
		},
		j = {
			"<cmd>ToggleTerm<cr>",
			"Open Terminal",
		},
	},
	c = {
		"NerdCommenter",
	},
}, { prefix = "<leader>" })

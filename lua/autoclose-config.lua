return {
	keys = {
		["("] = { escape = false, close = true, pair = "()" },
		["["] = { escape = false, close = true, pair = "[]" },
		["{"] = { escape = false, close = true, pair = "{}" },

		[">"] = { escape = true, close = false, pair = "<>" },
		[")"] = { escape = true, close = false, pair = "()" },
		["]"] = { escape = true, close = false, pair = "[]" },
		["}"] = { escape = true, close = false, pair = "{}" },

		['"'] = { escape = true, close = true, pair = '""' },
		["'"] = { escape = true, close = true, pair = "''" },
		["`"] = { escape = true, close = true, pair = "``" },
	},
	options = {
		disabled_filetypes = { "TelescopePrompt", "text", "markdown" },
		disable_when_touch = true,
		touch_regex = "[%w(%[{]",
		pair_spaces = false,
		auto_indent = true,
		disable_command_mode = false,
	},
}

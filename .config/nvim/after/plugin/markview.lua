require("markview").setup({
	code_blocks = { enable = true },
	tables = {
		enable = true,
		use_virt_lines = false,
		text = {
			"╭",
			"─",
			"╮",
			"┬",
			"├",
			"│",
			"┤",
			"┼",
			"╰",
			"─",
			"╯",
			"┴",

			-- These are used to indicate text alignment
			-- The last 2 are used for "center" alignment
			"╼",
			"╾",
			"╴",
			"╶",
		},
	},
})

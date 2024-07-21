local builtin = require("telescope.builtin")
local tele = require("telescope")

-- find files locally
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})

-- Find files on git a repo aka git file search
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
vim.keymap.set("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch in [N]eovim files" })

-- Telescope blind to symlinks
-- Vysor for nvim
tele.setup({
	pickers = {
		find_files = {
			follow = true,
		},
	},
})

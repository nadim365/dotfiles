-- Remap for paste so that we can continue pasting the selected text
vim.keymap.set("x", "<leader>p", '"_dP')

-- Remap for moving multiple lines togethere when selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Remap that takes the line below and appends to
-- the current line with a space
-- while keeping the cursor where it is
vim.keymap.set("n", "J", "mzJ'z")

-- Remap for Half - Page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Remap for allowing search terms to stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Convenience pasting and other remaps
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>:buffer#<CR>", { noremap = true })

vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>dpr", function()
	require("dap-python").test_method()
end)

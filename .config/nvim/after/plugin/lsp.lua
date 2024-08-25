-- note: diagnostics are not exclusive to lsp servers
-- so these can be global keybindings
--vim.diagnostic.config({
--float = { border = "rounded" },
--})
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		-- these will be buffer-local keybindings
		-- because they only work if you have an active language server

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
		vim.keymap.set("n", "<leader>dr", "<cmd>Telescope lsp_references<cr>", opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
	end,
})

-- Setting Up LspCofig
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = vim.tbl_deep_extend("force", lsp_capabilities, require("cmp_nvim_lsp").default_capabilities())

local default_setup = function(server)
	require("lspconfig")[server].setup({
		capabilities = lsp_capabilities,
	})
end

-- LSP setup ( mason and mason-lspconfig)
-- Downloading and configuring language servers
require("neodev").setup({})
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"html",
		"cssls",
		"quick_lint_js",
		"jdtls",
		"emmet_ls",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"sqls",
		"kotlin_language_server",
	},
	handlers = {
		default_setup,
	},
})

require("mason-tool-installer").setup({
	ensure_installed = {
		"black",
		"debugpy",
		"flake8",
		"isort",
		"mypy",
		"pylint",
	},
	integrations = {
		["mason-lspconfig"] = true,
		["mason-nvim-dap"] = true,
	},
})
-- Hooking up Language Servers installed from Mason to Neovim LSP client
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({
	require("lspconfig").lua_ls.setup({
		capabilities = lsp_capabilities,
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
				},
				diagnostics = {
					globals = { "vim" },
				},
				completion = {
					callSnippet = "Replace",
				},
				workspace = {
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	}),
})

-- Lang. Specific configs:
lspconfig.kotlin_language_server.setup({
	capabilities = lsp_capabilities,
})
lspconfig.pyright.setup({
	capabilities = lsp_capabilities,
})
lspconfig.jdtls.setup({
	capabilities = lsp_capabilities,
})
lspconfig.jsonls.setup({
	capabilities = lsp_capabilities,
})

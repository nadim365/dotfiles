local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.code_actions.refactoring,
		null_ls.builtins.formatting.black,
		null_ls.builtins.diagnostics.ktlint,
	},
})

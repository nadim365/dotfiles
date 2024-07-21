local dap = require("dap")
-- Kotlin Degbugger Config
dap.adapters.kotlin = {
	type = "executable",
	command = "kotlin-language-server",
	options = { auto_continue_if_many_stopped = false },
}

dap.configurations.kotlin = {
	{
		type = "kotlin",
		request = "launch",
		name = "This file",
		-- may differ, when in doubt, whatever your project structure may be,
		-- it has to correspond to the class file located at `build/classes/`
		-- and of course you have to build before you debug
		mainClass = function()
			local root = vim.fs.find("src", { path = vim.uv.cwd(), upward = true, stop = vim.env.HOME })[1] or ""
			local fname = vim.api.nvim_buf_get_name(0)
			-- src/main/kotlin/websearch/Main.kt -> websearch.MainKt
			return fname:gsub(root, ""):gsub("main/kotlin/", ""):gsub(".kt", "Kt"):gsub("/", "."):sub(2, -1)
		end,
		projectRoot = "${workspaceFolder}",
		jsonLogFile = "",
		enableJsonLogging = false,
	},
	{
		-- Use this for unit tests
		-- First, run
		-- ./gradlew --info cleanTest test --debug-jvm
		-- then attach the debugger to it
		type = "kotlin",
		request = "attach",
		name = "Attach to debugging session",
		port = 5005,
		args = {},
		projectRoot = vim.fn.getcwd,
		hostName = "localhost",
		timeout = 2000,
	},
}

dap.adapters.python = function()
	require("dap-python").setup("/Users/nadimac/.pyenv/shims/python")
end

-- dap.configurations.python = {
--{
-- The first three options are required by nvim-dap
--type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
--request = "launch",
--name = "Launch file",

---- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

--program = "${file}", -- This configuration will launch the current file if used.
--pythonPath = function()
---- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
---- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
--	local cwd = vim.fn.getcwd()
--if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
--		return cwd .. "/venv/bin/python"
--elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
--		return cwd .. "/.venv/bin/python"
--else
--		return "python"
--end
--end,
--},
--}

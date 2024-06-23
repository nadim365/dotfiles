local function system(command)
	local file = assert(io.popen(command, "r"))
	local output = file:read("*all"):gsub("%s+", "")
	file:close()
	return output
end

if vim.fn.executable("python3") > 0 then
	vim.g.python3_host_prog = system("which python3")
end

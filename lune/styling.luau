local process = require("@lune/process")

local paths = { "lune", "src", "test", ".config.luau" }

if process.args[1] ~= "--fix" then
	-- kinda cursed but, easiest way to do this.
	table.insert(paths, "--check")
end

local result = process.exec("stylua", paths, {
	stdio = "forward",
})

process.exit(result.code)

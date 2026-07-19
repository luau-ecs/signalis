local process = require("@lune/process")

local paths = { "lune", "src", "test", ".config.luau" }

-- kinda cursed but, easiest way to do this.
table.insert(paths, "--check")

local result = process.exec("stylua", paths, {
	stdio = "forward",
})

process.exit(result.code)

local fs = require("@lune/fs")
local serde = require("@lune/serde")

if not fs.isDir(".test_artifact") then
	fs.writeDir(".test_artifact")
end

fs.writeFile(
	".test_artifact/placeholder.testresult.json",
	serde.encode("json", {
		worked = true,
	})
)

return nil

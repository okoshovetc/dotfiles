local M = {}
local io = require("io")

--M.dbg_file = "/home/o.koshovets/_/logs/custom"
M.dbg_file = "/home/okoshovets/_/logs/custom"

M.log = function (...)
	local file = io.open(M.dbg_file, "a")
	if not file then
		return nil
	end
	file:write("[TARANTOOL] ")
	file:write(string.format(...))
	file:write("\n")
	file:close()
	return true
end

return M

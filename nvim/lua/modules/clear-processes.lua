local M = {}

function M.clear_processes()
	os.execute("killall -q node eslint_d prettierd")

	print("Processes cleared!")
end

return M

---@diagnostic disable: missing-fields
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mxsdev/nvim-dap-vscode-js",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			ui.setup()

			vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor)

			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<F1>", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<F3>", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<F13>", dap.restart)

			-- stylua: ignore start
			dap.listeners.before.attach.dapui_config = function() ui.open() end
			dap.listeners.before.launch.dapui_config = function() ui.open() end
			dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
			dap.listeners.before.event_exited.dapui_config = function() ui.close() end
			-- stylua: ignore end

			vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			for _, language in ipairs({ "typescript", "javascript" }) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node)",
						cwd = "${workspaceFolder}",
						args = { "${file}" },
						sourceMaps = true,
						protocol = "inspector",
					},
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (Typescript)",
						cwd = "${workspaceFolder}",
						runtimeArgs = { "--loader=ts-node/esm" },
						program = "${file}",
						runtimeExecutable = "node",
						-- args = { '${file}' },
						sourceMaps = true,
						protocol = "inspector",
						outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
						skipFiles = { "<node_internals>/**", "node_modules/**" },
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
				}
			end
		end,
	},
}

-- Plugin setup
require("mason").setup({})
require("mason-nvim-dap").setup({
	handlers = {},
})

-- LSP

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.diagnostic.config({
	virtual_text = true,
	underline = true,
	update_in_insert = true
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities  = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config('*',{capabilities = capabilities})

vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			diagnostics = { globals = {"vim"}}
		}
	}
})

vim.lsp.config('gdscript', {})
vim.lsp.config('clangd', {
	cmd =	{
		"clangd",
		-- "--query-driver=C:/msys64/ucrt64/bin/*.exe",
		"-j=16",
	},
})

vim.lsp.enable('clangd')

vim.lsp.config('basedpyright', {
	handlers = {
		["$/progress"] = function(err, result, ctx) end,
	},
	root_dir = function(bufnr, on_dir)
		local root = vim.fs.root(bufnr, {
			"pyproject.toml",
			"setup.py",
			"setup.cfg",
			"requirements.txt",
			".venv",
			".git",
		})

		if root then
			on_dir(root)
		end
	end,
})

vim.lsp.enable({
	"lua_ls",
	"gdscript",
	"clangd",
	"basedpyright"
})

--DAP
local dap = require('dap')

dap.listeners.before['event_terminated']['suppress_exit'] = function(session, body)
    -- suppress exit code notification

end
dap.adapters.godot = {
	type = 'server',
	host = '127.0.0.1',
	port = 6006,
}


dap.configurations.gdscript = {
  {
    type = 'godot',
    request = 'launch',
    name = 'Launch Scene',
    project = '${workspaceFolder}',
    launch_scene = true,
  }
}

dap.adapters.cppdbg = {
  type = 'executable',
  command = 'C:\\msys64\\ucrt64\\bin\\gdb.exe',
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopAtEntry = true,
	},
  {
    name = 'Attach to gdbserver :1234',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:1234',
    miDebuggerPath = '/usr/bin/gdb',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}

local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

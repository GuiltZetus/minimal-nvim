-- Plugin setup
require("mason").setup({})

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

vim.lsp.enable({
	"lua_ls",
	"gdscript"
})

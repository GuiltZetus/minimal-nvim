-- package manager
vim.pack.add({
	{src = 'https://github.com/nvim-telescope/telescope.nvim',
	dependencies = {
		{src = 'https://github.com/nvim-lua/plenary.nvim'},
		{src ='https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make'}}
	},
	{src = 'https://github.com/nvim-lua/plenary.nvim'},
	{src = 'https://github.com/mason-org/mason.nvim'},
	{src = 'https://github.com/neovim/nvim-lspconfig'},
	{src = 'https://github.com/nvim-mini/mini.nvim'},
	{src = 'https://github.com/rafamadriz/friendly-snippets'}
})

require("mini.notify").setup({
	content = {
		format = function(notif)
			return notif.msg
		end,
	},
})

require("mini.icons").setup()
require("mini.cmdline").setup()
require("mini.surround").setup()
require("mini.pairs").setup()

local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")

MiniPick.setup()
MiniExtra.setup()

vim.keymap.set("n", "<C-e>", function() MiniExtra.pickers.diagnostic() end )

require("mini.completion").setup({
	lsp_completion = {
		auto_setup = true,
		process_items = function(items, base)
			return require("mini.completion").default_process_items(items, base, {
				filtersort = "fuzzy",
			})
		end,
	}
})

require("mini.snippets").setup({
	snippets = {
		require("mini.snippets").gen_loader.from_lang(),
	},
})

require("mini.snippets").start_lsp_server({match = false})

-- package manager
vim.pack.add({
	{
		src = 'https://github.com/nvim-telescope/telescope.nvim',
		dependencies = {
			{ src = 'https://github.com/nvim-lua/plenary.nvim' },
			{ src = 'https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make' } }
	},
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/nvim-mini/mini.nvim' },
	{ src = 'https://github.com/rafamadriz/friendly-snippets' },
	{ src = 'https://github.com/mikavilpas/yazi.nvim'},
	{ src = 'https://github.com/mfussenegger/nvim-dap'},
	{ src = 'https://github.com/rcarriga/nvim-dap-ui'},
	{ src = 'https://github.com/nvim-neotest/nvim-nio'},
	{ src = 'https://github.com/jay-babu/mason-nvim-dap.nvim'},
	{ src = 'https://github.com/OXY2DEV/markview.nvim'},
	{ src = "https://github.com/mfussenegger/nvim-dap-python" },
})


require("dap-python").setup("C:/Users/User/AppData/Local/Python/pythoncore-3.14-64/python.exe")
require("dapui").setup()

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
require("mini.sessions").setup()
require("mini.pick").setup()

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

require("mini.snippets").start_lsp_server({ match = false })
require("dapui").setup({
  layouts = {
    {
      elements = {
        { id = "scopes",      size = 0.25 },
        { id = "breakpoints", size = 0.25 },
        { id = "stacks",      size = 0.25 },
        { id = "watches",     size = 0.25 },
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        { id = "repl",    size = 0.2 },
        { id = "console", size = 1 },
      },
      size = 0.25,
      position = "bottom",
    },
  },
  controls = {
    enabled = false,  -- removes the continue/step/stop button bar
  },
})

-- require("obsidian").setup({
-- 	legacy_commands = false,
-- 	pickers = {
-- 		name = "telescope.nvim",
-- 	},
-- 	workspaces = {
-- 		{
-- 			name = "personal",
-- 			path = "C:\\Users\\User\\Documents\\notes",
-- 		}
-- 	}
-- })

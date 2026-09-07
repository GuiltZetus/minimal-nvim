-- DEBUGGER
local dap = require('dap')
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<F8>", function() dap.terminate() end)
vim.keymap.set("n", "<F10>", function() dap.step_over() end)
vim.keymap.set("n", "<F11>", function() dap.step_into() end)
vim.keymap.set("n", "<F12>", function() dap.step_out() end)


-- SESSIONS
vim.keymap.set("n", "<leader>sn", function()
  vim.ui.input({ prompt = "Session name: " }, function(name)
    if name and name ~= "" then
			vim.cmd("wa")
      require("mini.sessions").write(name)
    end
  end)
end)

vim.keymap.set("n", "<leader>ss", function()
	vim.cmd("wa")
	require("mini.sessions").write()
end)

vim.keymap.set("n", "<leader>sl", function() require("mini.sessions").select() end)

-- FILE EXPLORER
vim.keymap.set("n", "<C-n>", function() require("yazi").yazi() end)
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})


-- Telescope
require('telescope').setup({
	mappings = {
		n = {
			["<C-v>"] = require('telescope.actions').select_vertical,
		}
	}
})
local telescope = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>fd", telescope.diagnostics, {desc = 'Telescope diagnostic'})
vim.keymap.set("n", "grr", telescope.lsp_references ,{desc = 'Telescope reference'})

--replaces text without losing yanked
vim.keymap.set("x", "p", [["_dP"]])
--delete without yank
vim.keymap.set({"n","v"}, "D", [["_d]])

vim.keymap.set("n", "<tab>", "gt")
vim.keymap.set("n", "<S-tab>", "gT")

vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "ch", ":nohl<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "Nzzzv")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>rc", "<cmd>restart<cr>")

--Undo history
vim.keymap.set("n", "<leader>uh",
function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end
)

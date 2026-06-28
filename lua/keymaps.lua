vim.keymap.set("n", "<C-n>", function() require("yazi").yazi() end)

vim.g.loaded_netrwPlugin = 1
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("yazi").setup({
      open_for_directories = true,
    })
  end,
})


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
vim.keymap.set("n", "<leader>fr", telescope.lsp_references ,{desc = 'Telescope reference'})
-- vim.keymap.set("n", "<C-v>", telescope.select_vertical ,{desc = 'Telescope reference'})

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

vim.keymap.set("n", "<leader>u",
function()
	vim.cmd.packadd("nvim.undotree")
	require("undotree").open()
end
)

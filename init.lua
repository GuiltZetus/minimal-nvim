require("vim._core.ui2").enable({})

require("pack")
require("options")
require("keymaps")
require("plugins-config")

-- local paths_to_check = { "", "\\.." }
-- local is_godot_project = false
-- local godot_project_path = ""
-- local cwd = vim.fn.getcwd()
--
-- for _, path in ipairs(paths_to_check) do
--     local project = cwd .. path .. "\\project.godot"
--     if vim.uv.fs_stat(project) then
--         is_godot_project = true
--         godot_project_path = cwd .. path
--         break
--     end
-- end
--
-- if is_godot_project then
--     local server = "\\\\.\\pipe\\godot-nvim"
--
--     if vim.v.servername == "" then
--         vim.fn.serverstart(server)
--     end
-- end

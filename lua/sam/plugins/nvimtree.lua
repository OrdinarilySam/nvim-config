local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
})

local api_setup, api = pcall(require, "nvim-tree.api")
if not api_setup then
	return
end

local git_add = function()
	local node = api.tree.get_node_under_cursor()
	local gs = node.git_status.file

	-- If the current node is a directory get children status
	if gs == nil then
		gs = (node.git_status.dir.direct ~= nil and node.git_status.dir.direct[1])
			or (node.git_status.dir.indirect ~= nil and node.git_status.dir.indirect[1])
	end

	-- If the file is untracked, unstaged or partially staged, we stage it
	if gs == "??" or gs == "MM" or gs == "AM" or gs == " M" then
		vim.cmd("silent !git add " .. node.absolute_path)

	-- If the file is staged, we unstage
	elseif gs == "M " or gs == "A " then
		vim.cmd("silent !git restore --staged " .. node.absolute_path)
	end

	api.tree.reload()
end

vim.keymap.set("n", "ga", git_add)

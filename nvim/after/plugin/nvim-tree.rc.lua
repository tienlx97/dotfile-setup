-- import nvim-tree plugin safely
local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

-- configure nvim-tree
nvimtree.setup({
	-- change folder arrow icons
	sort_by = "case_sensitive",
	hijack_cursor = true,
	system_open = {
		cmd = "open",
	},
	view = {
		width = 20,
		adaptive_size = true,
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				git = true,
				file = false,
				folder = false,
				folder_arrow = true,
			},
			glyphs = {
				bookmark = "🔖",
				folder = {
					arrow_closed = "⏵",
					arrow_open = "⏷",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "⌥",
					renamed = "➜",
					untracked = "★",
					deleted = "⊖",
					ignored = "◌",
				},
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			resize_window = true,
			window_picker = {
				enable = false,
			},
		},
	},
	-- 	git = {
	-- 		ignore = false,
	-- 	},
})

-- open nvim-tree on setup

local function open_nvim_tree(data)
	-- buffer is a [No Name]
	local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not no_name and not directory then
		return
	end

	-- change to the directory
	if directory then
		vim.cmd.cd(data.file)
	end

	-- open the tree
	require("nvim-tree.api").tree.open()
end

-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

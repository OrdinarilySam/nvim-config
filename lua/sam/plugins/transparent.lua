local setup, transparent = pcall(require, "transparent")
if not setup then
	return
end

transparent.setup({
	groups = { -- table: default groups
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	},
	extra_groups = {
		"NormalFloat",
		"NvimTreeNormal",
		"Directory",
		"NvimTreeFolderIcon",
		"WinSeparator",
		"CursorColumn",
		"NvimTreeGitDirty",
		"NvimTreeGitNew",
		"NvimTreeGitRenamed",
		"NvimTreeGitMerge",
		"NvimTreeGitStaged",
		"NvimTreeGitDeleted",
		"NvimTreeGitIgnored",
		"StatusLine",
		"StatusLineNC",
	}, -- table: additional groups that should be cleared
	exclude_groups = {}, -- table: groups you don't want to clear
})

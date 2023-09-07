local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	ensure_installed = {
		"css",
		"scss",
		"gitignore",
		"graphql",
		"html",
		"java",
		"javascript",
		"json",
		"lua",
		"python",
		"tsx",
		"typescript",
		"markdown",
		"vim",
		"yaml",
		"svelte",
	},
})

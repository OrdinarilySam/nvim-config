local setup, obsidian = pcall(require, "obsidian")
if not setup then
	return
end

obsidian.setup({
  dir = "/Users/sam/Library/Mobile Documents/iCloud~md~obsidian/"
})

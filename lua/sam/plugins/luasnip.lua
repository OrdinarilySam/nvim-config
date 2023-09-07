local setup, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if not setup then
	return
end

luasnip.lazy_load({ paths = "~/.config/nvim/lua/sam/snippets/" })

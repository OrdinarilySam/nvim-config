local status, _ = pcall(vim.cmd, "colorscheme catppuccin-frappe")

if not status then
	print("colorscheme not found")
	return
end

-- lsp/sourcekit.lua
return {
	cmd = { "sourcekit-lsp" },
	filetypes = { "swift", "objective-c", "objective-cpp" },
	root_markers = { "Package.swift", ".git", "compile_commands.json" },
}

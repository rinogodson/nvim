local header_val = {
	"╭╮╷╭─╴╭─╮╷ ╷╷╭┬╮",
	"│╰┤├╴ │ ││╭╯││││",
	"╵ ╵╰─╴╰─╯╰╯ ╵╵ ╵",
	"config by rinogodson",
}
return {
	"goolord/alpha-nvim",
	lazy = false,
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")
		startify.section.header.val = header_val
		alpha.setup(startify.config)
	end,
}

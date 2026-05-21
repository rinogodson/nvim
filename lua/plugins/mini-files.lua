return {
	"nvim-mini/mini.files",
	config = function()
		require("mini.files").setup({
			mappings = {
				close = "q",
				go_in = "",
				go_in_plus = "<enter>",
				go_out = "",
				go_out_plus = "<esc>",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
		})
	end,
	version = "*",
}

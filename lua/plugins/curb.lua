return {
	dir = "/Users/rinogodson/Documents/Code/Projects/curb.nvim",
	config = function()
		require("curb").setup({
			trigger_key = "<leader>curb",
			accept_key = "<C-y>",
			provider = {
				endpoint = "https://ai.hackclub.com/proxy/v1/chat/completions",
				model = "deepseek/deepseek-v4-flash",
				api_key_env = "HACKCLUB_API_KEY",
				api_key_file = nil,
			},
		})
	end,
}

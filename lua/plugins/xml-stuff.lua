return{
	{
		"windwp/nvim-autopairs",
    lazy=false,
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"windwp/nvim-ts-autotag",
    lazy=false,
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}

return {
	{ "tpope/vim-fugitive", lazy = false },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>e", "<cmd>LazyGit<cr>" },
		},
		config = function()
			-- nvim v0.8.0
			require("lazy").setup({
				{
					"kdheepak/lazygit.nvim",
					dependencies = {
						"nvim-lua/plenary.nvim",
					},
				},
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup()
		end,
	},
}

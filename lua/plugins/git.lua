return {
	{ "tpope/vim-fugitive", lazy = false },
	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = true,
		keys = {
			{ "<leader>m", "<cmd>GitConflictListQf<cr>" },
		},
	},
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>" },
		},
		config = function()
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
		keys = {
			{ "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
			{ "<leader>gn", "<cmd>Gitsigns next_hunk<cr>", desc = "Next hunk" },
			{ "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>", desc = "Previous hunk" },
			{ "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
			{ "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", desc = "Reset hunk" },
		},
		config = function()
			require("gitsigns").setup()
		end,
	},
}

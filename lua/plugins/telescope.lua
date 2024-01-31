return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{ "<leader>/", "<cmd>Telescope live_grep<cr>" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>" },
		{ "<leader>fp", "<cmd>Telescope pickers<cr>" },
		{ "<leader><leader>", "<cmd>Telescope git_files<cr>" },
		{ "<leader>gs", "<cmd>Telescope git_status<cr>" },
	},
}

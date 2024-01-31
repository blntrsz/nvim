return {
	{
		"nvim-tree/nvim-tree.lua",
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
		},
		config = function()
			require("nvim-tree").setup()
		end,
	}
}

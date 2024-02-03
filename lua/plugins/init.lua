return {
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},
	"github/copilot.vim",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"yamatsum/nvim-cursorline",
		config = function()
			require("nvim-cursorline").setup()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("lualine").setup({})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},
	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
}

return {
	"David-Kunz/gen.nvim",
	"github/copilot.vim",
	{
		"robitx/gp.nvim",
		config = function()
			require("gp").setup({
				openai_api_key = { "pass", "OPENAI_API_KEY" },
			})
		end,
	},
}

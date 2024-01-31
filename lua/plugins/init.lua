return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    "github/copilot.vim",
    { "stevearc/dressing.nvim", event = "VeryLazy" },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {"yamatsum/nvim-cursorline", config = function()
        require('nvim-cursorline').setup()
    end}
}


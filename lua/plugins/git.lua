return {
  {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
      vim.keymap.set("n", "gh", "<cmd>diffget //2<CR>")
      vim.keymap.set("n", "gl", "<cmd>diffget //3<CR>")
      vim.keymap.set("n", "<leader>gl", "<cmd>Git log<CR>")
    end,
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
      { "<leader>gh",  "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
      { "<leader>gn",  "<cmd>Gitsigns next_hunk<cr>",    desc = "Next hunk" },
      { "<leader>gp",  "<cmd>Gitsigns prev_hunk<cr>",    desc = "Previous hunk" },
      { "<leader>gb",  "<cmd>Gitsigns blame_line<cr>",   desc = "Blame line" },
      { "<leader>gr",  "<cmd>Gitsigns reset_hunk<cr>",   desc = "Reset hunk" },
      { "<leader>ghs", "<cmd>Gitsigns stage_hunk<cr>",   desc = "Stage Hunk" },
    },
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set("n", "do", "<cmd>DiffviewOpen<CR>")
      vim.keymap.set("n", "dc", "<cmd>DiffviewClose<CR>")
    end,
  }
}

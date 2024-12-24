return {
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
      { "<leader>gp",  "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview hunk" },
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
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = true,
    keys = {
      { "<leader>ng", "<cmd>Neogit<cr>", desc = "Neogit" },
    }
  }
}

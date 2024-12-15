return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    pickers = {
      find_files = {
        hidden = true,
      },
      git_files = {
        hidden = true,
      },
    },
    defaults = {
      file_ignore_patterns = {
        "node_modules/*",
        ".git/*",
      },
    },
  },
  keys = {
    { "<leader>/",        "<cmd>Telescope live_grep theme=ivy<cr>" },
    { "<leader>ff",       "<cmd>Telescope find_files theme=ivy<cr>" },
    { "<leader>fp",       "<cmd>Telescope pickers theme=ivy<cr>" },
    { "<leader><leader>", "<cmd>Telescope git_files theme=ivy<cr>" },
    { "<leader>gs",       "<cmd>Telescope git_status theme=ivy<cr>" },
  },
}

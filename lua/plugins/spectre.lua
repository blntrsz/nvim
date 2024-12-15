return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>F", '<cmd>lua require("spectre").toggle()<cr>' },
  },
}

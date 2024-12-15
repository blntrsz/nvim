return {
  {
    "theprimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>hh", "<cmd>lua require('harpoon.mark').add_file()<cr>",        desc = "Harpoon add mark" },
      { "<leader>ha", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Harpoon quick menu" },
      { "<C-h>",      "<cmd>lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Harpoon nav file 1" },
      { "<C-j>",      "<cmd>lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Harpoon nav file 2" },
      { "<C-k>",      "<cmd>lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Harpoon nav file 3" },
      { "<C-l>",      "<cmd>lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Harpoon nav file 4" },
    },
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      vim.keymap.set("n", "<leader>ha", mark.add_file)
      vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu)

      vim.keymap.set("n", "<leader>h1", function()
        ui.nav_file(1)
      end)
      vim.keymap.set("n", "<leader>h2", function()
        ui.nav_file(2)
      end)
      vim.keymap.set("n", "<leader>h3", function()
        ui.nav_file(3)
      end)
      vim.keymap.set("n", "<leader>h4", function()
        ui.nav_file(4)
      end)
    end,
  },
}

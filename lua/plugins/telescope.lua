return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-smart-history.nvim" },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        history = {
          path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
          limit = 1000,
        },
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" },
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },

      extensions_list = { "themes", "terms" },
    })
    telescope.load_extension('smart_history')
  end,
  keys = {
    { "<leader>/",        "<cmd>Telescope live_grep<cr>" },
    { "<leader>ff",       "<cmd>Telescope find_files<cr>" },
    { "<leader>fp",       "<cmd>Telescope pickers<cr>" },
    { "<leader><leader>", "<cmd>Telescope git_files<cr>" },
    { "<leader>gs",       "<cmd>Telescope git_status<cr>" },
  },
}

return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}, -- this is equalent to setup({}) function
  },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end,
    lazy = false,
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
    },
  },
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>F", '<cmd>lua require("spectre").toggle()<cr>' },
    },
  },
  {
    "kamykn/spelunker.vim",
    config = function()
      vim.cmd("highlight SpelunkerSpellBad cterm=undercurl gui=undercurl guisp=NONE guifg=NONE")
      vim.cmd(
        "highlight SpelunkerComplexOrCompoundWord cterm=undercurl ctermfg=NONE gui=undercurl guifg=NONE guisp=NONE"
      )
    end,
  },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  {
    "xiyaowong/transparent.nvim",
    name = "transparent",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
        },
      })
      require("transparent").clear_prefix("nvim-treesitter/nvim-treesitter-context")
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { "kkharji/sqlite.lua",           module = "sqlite" },
      { "nvim-telescope/telescope.nvim" },
    },
    keys = {
      { "<leader>nn", "<cmd>Telescope neoclip<cr>" },
    },
    config = function()
      require("neoclip").setup({
        default_register = "+",
      })
    end,
  },
  {
    "RRethy/vim-illuminate",
  },
}

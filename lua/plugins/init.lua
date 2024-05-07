return {
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
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-treesitter.configs").setup({})
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({

        ensure_installed = { "javascript", "typescript", "tsx", "css", "html" },
        auto_install = true,

        indent = {
          enable = true,
        },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = { "markdown" },
        },
      })
      local treesitter_parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      treesitter_parser_config.templ = {
        install_info = {
          url = "https://github.com/vrischmann/tree-sitter-templ.git",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "master",
        },
      }

      vim.treesitter.language.register("templ", "templ")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
      })
    end,
  },
  {
    "nvim-lua/plenary.nvim",
    name = "plenary",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "RRethy/vim-illuminate",
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("lualine").setup()
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
}

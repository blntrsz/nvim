return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "javascript", "typescript", "tsx", "css", "html" },
        highlight = {
          enable = true,
        },
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end,
      }
    end,
  },
}

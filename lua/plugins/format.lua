return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        go = { "goimports", "gofmt" },
        templ = { "goimports", "templ" },
      },
      -- Set up format-on-save
      format_on_save = { timeout_ms = 1000, lsp_fallback = true },
      -- Customize formatters
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
  },
  {
    "danymat/neogen",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local neogen = require("neogen")

      neogen.setup({
        snippet_engine = "luasnip",
      })

      vim.keymap.set("n", "<leader>nf", function()
        neogen.generate({ type = "func" })
      end)

      vim.keymap.set("n", "<leader>nt", function()
        neogen.generate({ type = "type" })
      end)
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  }
}

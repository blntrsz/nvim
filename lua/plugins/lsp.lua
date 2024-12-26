return {
  {
    "nvimdev/lspsaga.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig_defaults = require("lspconfig").util.default_config
      lspconfig_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lspconfig_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
      )

      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "astro",
          "cssls",
          "vtsls",
          "cssmodules_ls",
          "gopls",
          "lua_ls",
        },
      })
      require("mason-lspconfig").setup_handlers({
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({})
        end,
        ["vtsls"] = function()
          require("lspconfig").vtsls.setup({
            root_dir = require("lspconfig").util.root_pattern(
              ".git",
              "pnpm-workspace.yaml",
              "pnpm-lock.yaml",
              "yarn.lock",
              "package-lock.json",
              "bun.lockb"
            ),
            typescript = {
              tsserver = {
                maxTsServerMemory = 12288,
              },
            },
            experimental = {
              completion = {
                entriesLimit = 3,
              },
            },
          })
        end,
      })
    end,
  },
}

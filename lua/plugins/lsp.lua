local servers = {
  "lua_ls",
  "vtsls",
  "pyright",
  "jsonls",
  "yamlls",
  "tailwindcss",
  "bashls",
  "cssls",
  "gopls",
  "zls",
}

local completion_servers = {}

for _, server in ipairs(servers) do
  completion_servers[server] = {}
end

return {
  "williamboman/mason-lspconfig.nvim",
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = servers })
    end
  },
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
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    opts = {
      servers = completion_servers,
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
  }
}

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

local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
local copilot_bin = (vim.fn.executable("copilot-language-server") == 1)
    and "copilot-language-server"
  or (mason_bin .. "/copilot-language-server")

-- copilot-lsp provides the LSP config; point cmd at Mason bin
completion_servers.copilot_ls = {
  cmd = { copilot_bin, "--stdio" },
}

return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({ PATH = "prepend" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({ ensure_installed = servers })
    end,
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
    dependencies = {
      'saghen/blink.cmp',
      'copilotlsp-nvim/copilot-lsp',
      'williamboman/mason.nvim',
    },
    opts = {
      servers = completion_servers,
    },
    config = function(_, opts)
      for server, config in pairs(opts.servers) do
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end
  }
}

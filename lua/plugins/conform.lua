local is_windows = vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1

local eslint_roots = {
  "eslint.config.js",
  "eslint.config.mjs",
  "eslint.config.cjs",
  "eslint.config.ts",
  "eslint.config.mts",
  "eslint.config.cts",
  ".eslintrc",
  ".eslintrc.js",
  ".eslintrc.cjs",
  ".eslintrc.yaml",
  ".eslintrc.yml",
  ".eslintrc.json",
}

local function buf_dir(bufnr)
  local filename = vim.api.nvim_buf_get_name(bufnr)
  if filename == "" then
    return vim.fn.getcwd()
  end

  return vim.fs.dirname(filename)
end

local function has_local_bin(bin, bufnr)
  local dir = buf_dir(bufnr)
  local executable = is_windows and (bin .. ".cmd") or bin

  while dir and dir ~= "" do
    local path = vim.fs.joinpath(dir, "node_modules", ".bin", executable)
    if vim.fn.executable(path) == 1 then
      return true
    end

    local parent = vim.fs.dirname(dir)
    if parent == dir then
      break
    end
    dir = parent
  end

  return false
end

local function pick_local(bufnr, choices)
  for _, choice in ipairs(choices) do
    if has_local_bin(choice.bin, bufnr) then
      return choice.name
    end
  end
end

local function js_formatters(bufnr)
  local formatters = {}

  local linter = pick_local(bufnr, {
    { name = "eslint", bin = "eslint" },
    { name = "oxlint", bin = "oxlint" },
  })

  local formatter = pick_local(bufnr, {
    { name = "prettier", bin = "prettier" },
    { name = "oxfmt", bin = "oxfmt" },
  })

  if linter then
    table.insert(formatters, linter)
  end

  if formatter then
    table.insert(formatters, formatter)
  end

  return formatters
end

local function eslint_cwd(_, ctx)
  return vim.fs.root(ctx.dirname, eslint_roots) or vim.fs.root(ctx.dirname, { "package.json" })
end

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = function()
    local util = require("conform.util")

    return {
      formatters = {
        eslint = {
          command = util.from_node_modules(is_windows and "eslint.cmd" or "eslint"),
          args = { "--fix", "$FILENAME" },
          cwd = eslint_cwd,
          exit_codes = { 0, 1 },
          stdin = false,
          tmpfile_format = "conform.$RANDOM.$FILENAME",
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = js_formatters,
        javascriptreact = js_formatters,
        typescript = js_formatters,
        typescriptreact = js_formatters,
        go = { "goimports", "gofmt" },
      },
      format_on_save = { timeout_ms = 1000, lsp_format = "fallback" },
    }
  end,
}

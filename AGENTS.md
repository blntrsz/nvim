# Neovim Configuration - Agent Guidelines

## Build/Lint/Test Commands
- `stylua .` - Format Lua files (uses stylua.toml config)
- `:Lazy sync` - Update/install plugins within Neovim
- No traditional test suite - configuration is tested by loading Neovim

## Code Style Guidelines
- **Language**: Lua only
- **Indentation**: 2 spaces (configured in stylua.toml)
- **String quotes**: Double quotes preferred
- **Function calls**: No parentheses when possible (`require "module"` not `require("module")`)
- **Imports**: Use `require()` at top of files, group by type (built-in, plugins, local)
- **Plugin structure**: Return table with plugin specs in `lua/plugins/`
- **Config organization**: 
  - `lua/config/` - Core Neovim settings
  - `lua/plugins/` - Plugin configurations as separate files
- **Naming**: snake_case for files/variables, follow existing patterns
- **Error handling**: Use pcall() for potentially failing operations
- **Comments**: Minimal, only for complex logic or important notes
- **Plugin configs**: Use lazy.nvim spec format with dependencies clearly defined
- **Keymaps**: Define in plugin config or dedicated keymap file, use descriptive desc fields
- **LSP**: Configure through mason + lspconfig pattern, use blink.cmp capabilities
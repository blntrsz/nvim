require("config.set")
require("config.remap")
require("config.lazy")
require("config.multigrep")

vim.keymap.set("n", "<leader>/", require("config.multigrep").live_multi_grep)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "qf" },
  command = [[nnoremap <buffer> <CR> <CR>:cclose<CR>]],
})

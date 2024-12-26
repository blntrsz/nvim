vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-c>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>copen<CR>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "do", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "dc", "<cmd>DiffviewClose<CR>")

vim.keymap.set("n", "<leader>/", require("config.multigrep").live_multi_grep)

-- LSP
vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>")
vim.keymap.set("n", "<leader>cr", "<cmd>Lspsaga rename<cr>")
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>")
vim.keymap.set("n", "<leader>o", "<cmd>Lspsaga outline<cr>")
vim.keymap.set("n", "<leader>h", "<cmd>Lspsaga diagnostic_jump_prev<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>Lspsaga diagnostic_jump_next<cr>")
vim.keymap.set("n", "<leader>q", "<cmd>Lspsaga show_cursor_diagnostics<cr>")
vim.keymap.set("n", "gd", "<cmd>Lspsaga go_to_definition<cr>")

vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-c>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<leader>o", "<cmd>copen<CR>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
vim.keymap.set(
  "n",
  "<leader>vd",
  "<cmd>lua vim.diagnostic.open_float()<cr>",
  { desc = "View Diagnostics" }
)
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>")
vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>")

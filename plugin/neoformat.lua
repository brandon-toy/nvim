vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
vim.keymap.set("n", "<leader>fs", "<cmd>Neoformat prettierd<cr>")

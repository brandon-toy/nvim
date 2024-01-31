require("neotest").setup({
    adapters = {
        require("neotest-jest"),
    },
})

vim.api.nvim_set_keymap("n", "<leader>ts", "<cmd>lua require('neotest').run.run()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tw", "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>",
    {})
vim.api.nvim_set_keymap("n", "<leader>to", "<cmd>lua require('neotest').output.open()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tO", "<cmd>lua require('neotest').output.open({enter=true})<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua require('neotest').summary.toggle()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua require('neotest').jump.next()<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tN", "<cmd>lua require('neotest').jump.prev()<CR>", {})

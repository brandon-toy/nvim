local builtin = require('telescope.builtin')
-- You dont need to set any of these options. These are the default ones. Only
require('telescope').setup{ 
    defaults = { 
        file_ignore_patterns = { 
            "node_modules",
            "build"
        }
    },
    pickers = {
        find_files = {'rg', '--files', '--hidden', '-g', '!.git'}, 
    } 
}
-- the loading is important
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


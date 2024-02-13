local null_ls = require("null-ls")

null_ls.setup({
    debug=true,
    sources = {
        null_ls.builtins.formatting.beautysh,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.checkstyle.with({
        extra_args = { "-c", "/google_checks.xml" }, -- or "/sun_checks.xml" or path to self written rules
    }),
    },
})

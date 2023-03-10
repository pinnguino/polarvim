local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.stylua, -- lua formatting
        diagnostics.cppcheck.with {extra_args = {"--enable=warning", "$FILENAME" }}, -- C++ diagnostics
        formatting.astyle, -- C++ formatting
        formatting.prettier, -- Formatting for several files
        diagnostics.jsonlint, -- JSON linter
    },
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettier.with({
            extra_filetypes = { "javascriptreact", "typescriptreact" },
            extra_args = { "--single-quote", "--jsx-single-quote" },
        }),
    },
    on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
            local augroup = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})

